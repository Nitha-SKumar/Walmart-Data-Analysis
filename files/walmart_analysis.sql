CREATE DATABASE IF NOT EXISTS salesDataWalmart;
CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL primary key,
	branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price	DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    VAT float(6,4) NOT NULL,
    total DECIMAL(12,4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment_method VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12,4) NOT NULL,
    rating FLOAT(2,1)
);

-- ***************************************************************************************************************************************************************************
-- Adding a new column: time_of_day
SELECT time,
	(
   CASE
		WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
		WHEN  time BETWEEN "12:00:00" AND "16:00:00" THEN "Afternoon"
		ELSE "Evening"
	END
    ) AS time_of_day
FROM sales;

ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

UPDATE sales
SET time_of_day =
(
    CASE
		WHEN time BETWEEN "00:00:00" AND "12:00:00"  THEN "Morning"
		WHEN time BETWEEN "12:00:00" AND "16:00:00" THEN "Afternoon"
		ELSE "Evening"
	END
    );
    
-- Adding day_name
SELECT 
	date, 
    DAYNAME(date)
FROM sales;

ALTER TABLE sales 
	ADD COLUMN day_name VARCHAR(10);

UPDATE sales	
SET day_name= DAYNAME(date);

-- month_name
SELECT 
	date, 
    MONTHNAME(date)
FROM sales;
    
ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date);

-- ****************************************************************************************************************************************************************************
-- City Analysis
-- Count of unique cities
SELECT 
    COUNT(DISTINCT(city)) 
FROM sales;

-- Listing branches in each city
SELECT    
    city, 
    branch,
    COUNT(*) AS branch_count
FROM sales
GROUP BY city, branch;

-- Product Line Analysis
-- Identification of unique product lines
SELECT
    DISTINCT(product_line)
FROM sales;

-- Most selling product lines
SELECT 
    product_line,
    COUNT(*)
FROM sales
GROUP BY product_line;

-- Product line with the largest revenue
SELECT
    product_line, 
    SUM(total) AS revenue
FROM sales
GROUP BY product_line
ORDER BY revenue;

-- Product line with the highest VAT
SELECT 
    product_line, 
    AVG(VAT) AS avg_VAT 
FROM sales
GROUP BY product_line
ORDER BY avg_VAT;

-- Average rating of each product line
SELECT 
    product_line,
    AVG(rating) as avg_rating
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;

-- Classification of product lines as "Good" or "Bad" based on average sales
WITH avg_sales AS (
    SELECT AVG(total) AS avg_total_sales
    FROM sales
)
SELECT product_line, SUM(total) AS total_sales,
       CASE
           WHEN SUM(total) > (SELECT avg_total_sales FROM avg_sales) THEN 'Good'
           ELSE 'Bad'
       END AS performance
FROM sales
GROUP BY product_line
ORDER BY total_sales DESC;

-- Payment Method Analysis
-- Most common payment method
SELECT 
    payment_method,
    COUNT(payment_method)
FROM sales
GROUP BY payment_method;

-- Unique payment methods
SELECT 
    DISTINCT(payment_method) as payment_method
FROM sales;

-- Revenue contribution by different payment methods
SELECT payment_method,
       SUM(total) AS total_revenue,
       COUNT(invoice_id) AS transaction_count
FROM sales
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- Sales Trend Analysis

-- Total revenue by month
SELECT 
    month_name, 
    SUM(total) AS revenue
FROM sales
GROUP BY month_name
ORDER BY revenue;

-- Month with the highest Cost of Goods Sold (COGS)
SELECT 
    month_name, 
    SUM(cogs) AS cogs_most
FROM sales
GROUP BY month_name
ORDER BY cogs_most;

-- Seasonal trends in sales
SELECT EXTRACT(MONTH FROM date) AS month,
       SUM(total) AS total_sales
FROM sales
GROUP BY month
ORDER BY month;

-- Forecasting future sales using historical data
SELECT EXTRACT(YEAR FROM date) AS year,
       EXTRACT(MONTH FROM date) AS month,
       SUM(total) AS total_sales
FROM sales
GROUP BY year, month
ORDER BY year, month;

-- Branch Analysis
-- Branches selling more products than the average
SELECT  
    branch, 
    SUM(quantity) AS qty 
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);

-- Sales performance across branches
SELECT branch,
       SUM(total) AS total_sales,
       AVG(rating) AS avg_rating
FROM sales
GROUP BY branch
ORDER BY total_sales DESC;

-- Gender distribution per branch
SELECT 
    gender, branch,
    COUNT(*) AS gender_cnt
FROM sales
GROUP BY gender, branch
ORDER BY branch;

-- Average customer ratings per branch and time of day
SELECT 
    time_of_day,
    AVG(rating) AS avg_rating
FROM sales
WHERE branch="C"
GROUP BY time_of_day
ORDER BY avg_rating;

-- Best average ratings per day of the week for each branch
WITH AverageRatingsPerDay AS (
    SELECT 
        branch,
        day_name,
        AVG(rating) AS avg_rating
    FROM sales
    GROUP BY branch, day_name
)
SELECT 
    branch,
    day_name,
    avg_rating
FROM (
    SELECT 
        branch,
        day_name,
        avg_rating,
        ROW_NUMBER() OVER (PARTITION BY branch ORDER BY avg_rating DESC) AS row_num
    FROM AverageRatingsPerDay
) AS ranked
WHERE row_num = 1
ORDER BY branch;

-- Revenue Analysis
-- City with the largest revenue
SELECT 
    city, 
    SUM(total) AS revenue
FROM sales
GROUP BY city
ORDER BY revenue;

-- Customer types contributing the most revenue
SELECT 
    customer_type,
    sum(total) AS total_revenue
FROM sales
GROUP BY customer_type
ORDER BY total_revenue DESC;

-- Total value a customer brings over their entire relationship with the business
WITH customer_metrics AS (
    SELECT customer_type,
           SUM(total) AS total_revenue,
           COUNT(invoice_id) AS purchase_count
    FROM sales
    GROUP BY customer_type
),
avg_metrics AS (
    SELECT AVG(total_revenue) AS avg_revenue,
           AVG(purchase_count) AS avg_frequency
    FROM customer_metrics
)
SELECT customer_type,
       total_revenue,
       purchase_count,
       total_revenue * purchase_count AS estimated_lifetime_value
FROM customer_metrics;

-- Comparison of sales performance across branches
SELECT branch,
       SUM(total) AS total_sales,
       AVG(rating) AS avg_rating
FROM sales
GROUP BY branch
ORDER BY total_sales DESC;

-- Customer Analysis
-- Unique customer types
SELECT 
    DISTINCT(customer_type) AS customer 
FROM sales;

-- Most common customer type
SELECT
    customer_type,
    COUNT(customer_type) AS cus_count
FROM sales
GROUP BY customer_type
ORDER BY cus_count DESC;

-- Customer type that buys the most
SELECT 
    customer_type,
    COUNT(*) AS cus_count
FROM sales
GROUP BY customer_type
ORDER BY cus_count DESC;

-- Customer type paying the most in VAT
SELECT
    customer_type, AVG(VAT) AS avg_VAT
FROM sales
GROUP BY customer_type
ORDER BY avg_VAT;

-- Customer segmentation based on purchasing behavior and demographics using RFM analysis
WITH recency AS (
    SELECT customer_type, MAX(date) AS last_purchase_date
    FROM sales
    GROUP BY customer_type
),
frequency AS (
    SELECT customer_type, COUNT(invoice_id) AS purchase_count
    FROM sales
    GROUP BY customer_type
),
monetary AS (
    SELECT customer_type, SUM(total) AS total_spent
    FROM sales
    GROUP BY customer_type
),
rfm AS (
    SELECT recency.customer_type,
           DATEDIFF(CURRENT_DATE, last_purchase_date) AS recency,
           purchase_count AS frequency,
           total_spent AS monetary
    FROM recency
    JOIN frequency ON recency.customer_type = frequency.customer_type
    JOIN monetary ON recency.customer_type = monetary.customer_type
)
SELECT * FROM rfm;

-- Gender Analysis
-- Gender distribution of customers
SELECT 
    gender, 
    COUNT(*) AS gender_cnt
FROM sales
GROUP BY gender
ORDER BY gender_cnt DESC;

-- Most common product line by gender
SELECT  
    gender, 
    product_line, 
    count(gender) as total_cnt
FROM sales
GROUP BY gender, product_line
ORDER BY total_cnt DESC;

-- Customer purchase patterns based on gender and customer type
SELECT gender, customer_type,
       COUNT(invoice_id) AS purchase_count,
       SUM(total) AS total_spent
FROM sales
GROUP BY gender, customer_type
ORDER BY total_spent DESC;

-- Gender of most customers
SELECT 
    gender, 
    COUNT(*) AS gender_cnt
FROM sales
GROUP BY gender
ORDER BY gender_cnt DESC;

-- Rating Analysis
-- Average rating of each product line
SELECT 
    product_line,
    AVG(rating) as avg_rating
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;

-- Customer feedback and ratings analysis to gauge sentiment
SELECT rating, COUNT(*) AS rating_count
FROM sales
GROUP BY rating
ORDER BY rating DESC;

-- Time of Day Analysis
-- Number of sales made at different times of the day per weekday
SELECT
    time_of_day, 
    count(*) AS total_sales
FROM sales
GROUP BY time_of_day;

-- Time of the day customers give the most ratings
SELECT 
    time_of_day,
    AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY avg_rating;

-- Time of the day customers give the most ratings per branch
SELECT 
    time_of_day,
    AVG(rating) AS avg_rating
FROM sales
WHERE branch="C"
GROUP BY time_of_day
ORDER BY avg_rating;

-- VAT Analysis
-- City with the largest tax percent (VAT)
SELECT 
    city, 
    AVG(VAT) as max_VAT
FROM sales
GROUP BY city
ORDER BY max_VAT DESC;

-- Customer type paying the most in VAT
SELECT
    customer_type, AVG(VAT) AS avg_VAT
FROM sales
GROUP BY customer_type
ORDER BY avg_VAT;
