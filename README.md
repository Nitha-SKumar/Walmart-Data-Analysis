# Walmart-Data-Analysis
## Project Overview
This project focuses on analyzing Walmart sales data to identify the top-performing branches and products, examine sales trends across various items, and understand customer behavior. The primary goal is to explore ways to enhance and optimize sales strategies. The dataset used in this analysis is sourced from the Kaggle.

### Project Objectives

- The primary goal of this project is to analyze Walmart's sales data to understand the various factors influencing the sales performance across different branches.



### Dataset Information

It includes sales transaction data from three Walmart branches located in Mandalay, Yangon, and Naypyitaw. The dataset comprises 17 columns and 1000 rows, with the following details:

| Column                  | Description                                   | Data Type          |
|-------------------------|-----------------------------------------------|--------------------|
| invoice_id              | Invoice number of the sales transaction       | VARCHAR(30)        |
| branch                  | Branch where the sales occurred               | VARCHAR(5)         |
| city                    | City where the branch is located              | VARCHAR(30)        |
| customer_type           | Type of customer                              | VARCHAR(30)        |
| gender                  | Customer's gender                             | VARCHAR(10)        |
| product_line            | Product line of the sold item                 | VARCHAR(100)       |
| unit_price              | Price per unit of the product                 | DECIMAL(10, 2)     |
| quantity                | Quantity of the product sold                  | INT                |
| VAT                     | Value Added Tax on the purchase               | FLOAT(6, 4)        |
| total                   | Total cost of the purchase                    | DECIMAL(10, 2)     |
| date                    | Date of the purchase                          | DATE               |
| time                    | Time of the purchase                          | TIMESTAMP          |
| payment_method          | Method of payment used                        | DECIMAL(10, 2)     |
| cogs                    | Cost of Goods Sold                            | DECIMAL(10, 2)     |
| gross_margin_percentage | Gross margin percentage                       | FLOAT(11, 9)       |
| gross_income            | Gross income from the transaction             | DECIMAL(10, 2)     |
| rating                  | Customer rating                               | FLOAT(2, 1)        |


### Analysis

#### City Analysis:

- Count of unique cities.
- Listing branches in each city.
#### Product Line Analysis:

- Identification of unique product lines.
- Most selling product lines.
- Product line with the largest revenue.
- Product line with the highest VAT.
- Average rating of each product line.
- Classification of product lines as "Good" or "Bad" based on average sales.
#### Payment Method Analysis:

- Most common payment method.
- Unique payment methods.
- Revenue contribution by different payment methods.
- Sales Trend Analysis:

#### Total revenue by month.
- Month with the highest Cost of Goods Sold (COGS).
- Seasonal trends in sales.
- Forecasting future sales using historical data.
#### Branch Analysis:

- Branches selling more products than the average.
- Sales performance across branches.
- Gender distribution per branch.
- Average customer ratings per branch and time of day.
- Best average ratings per day of the week for each branch.
#### Revenue Analysis:

- City with the largest revenue.
- Customer types contributing the most revenue.
- Total value a customer brings over their entire relationship with the business.
- Comparison of sales performance across branches.
#### Customer Analysis:

- Unique customer types.
- Most common customer type.
- Customer type that buys the most.
- Customer type paying the most in VAT.
- Customer segmentation based on purchasing behavior and demographics using RFM analysis.
#### Gender Analysis:

- Gender distribution of customers.
- Most common product line by gender.
- Customer purchase patterns based on gender and customer type.
- Gender of most customers.
#### Rating Analysis:

- Average rating of each product line.
- Time of day customers give most ratings.
- Customer feedback and ratings analysis to gauge sentiment.
#### Time of Day Analysis:

- Number of sales made at different times of the day per weekday.
- Time of the day customers give the most ratings.
- Time of the day customers give the most ratings per branch.
#### VAT Analysis:

- City with the largest tax percent (VAT).
- Customer type paying the most in VAT.

### Analyzed Results
#### City Analysis
- Count of Unique Cities: The dataset contains three unique cities.
- Branches in Each City: The distribution of branches across different cities is detailed, showing how many branches exist in each city.

Product Line Analysis
Unique Product Lines: The dataset includes several unique product lines.
Most Selling Product Lines: The top-selling product lines are identified based on the count of sales.
Product Line with Largest Revenue: The product line generating the highest revenue is highlighted.
Product Line with Highest VAT: The product line with the highest average VAT is noted.
Average Rating of Each Product Line: The average customer rating for each product line is provided.
Product Line Performance (Good/Bad): Product lines are classified as "Good" or "Bad" based on whether their sales exceed the average sales.
Payment Method Analysis
Most Common Payment Method: The most frequently used payment method is identified.
Unique Payment Methods: The dataset includes several distinct payment methods.
Revenue Contribution by Payment Methods: Revenue generated by each payment method is detailed, along with the number of transactions.
Sales Trend Analysis
Total Revenue by Month: Monthly revenue is calculated, highlighting trends and identifying the highest revenue months.
Month with Highest COGS: The month with the highest Cost of Goods Sold is identified.
Seasonal Trends in Sales: Sales trends are analyzed by month to identify seasonal patterns.
Forecasting Future Sales: Historical data is used to project future sales.
Branch Analysis
Branches Selling More than Average: Branches with sales exceeding the average are listed.
Sales Performance Across Branches: Total sales and average customer ratings for each branch are compared.
Gender Distribution per Branch: The gender distribution of customers at each branch is detailed.
Average Ratings by Time of Day and Branch: The average customer ratings at different times of the day, especially for branch "C", are analyzed.
Best Average Ratings by Day for Each Branch: The best average ratings per day of the week for each branch are identified.
Revenue Analysis
City with Largest Revenue: The city generating the highest total revenue is identified.
Customer Types Contributing Most Revenue: Revenue contributions from different customer types are analyzed.
Customer Lifetime Value: The estimated total value a customer brings over their relationship with the business is calculated.
Sales Performance Comparison Across Branches: A comparison of total sales and average ratings across branches is provided.
Customer Analysis
Unique Customer Types: The dataset includes various distinct customer types.
Most Common Customer Type: The most frequently occurring customer type is identified.
Customer Type Buying the Most: The customer type with the highest purchase frequency is highlighted.
Customer Type Paying Most VAT: The customer type with the highest average VAT payments is noted.
Customer Segmentation Using RFM Analysis: Customers are segmented based on Recency, Frequency, and Monetary value.
Gender Analysis
Gender Distribution of Customers: The overall gender distribution of customers is summarized.
Most Common Product Line by Gender: The most popular product lines for each gender are identified.
Customer Purchase Patterns by Gender and Type: Purchase patterns are analyzed based on gender and customer type.
Gender of Most Customers: The gender with the highest number of customers is highlighted.
Rating Analysis
Average Rating of Each Product Line: The average rating for each product line is provided.
Customer Feedback and Ratings Sentiment: Customer feedback and ratings are analyzed to gauge overall sentiment.
Time of Day Analysis
Sales by Time of Day: The number of sales made at different times of the day is analyzed.
Ratings by Time of Day: The times of day when customers give the most ratings are identified.
Ratings by Time of Day for Branch "C": Specific analysis of ratings by time of day for branch "C".
VAT Analysis
City with Largest VAT: The city with the highest average VAT percentage is identified.
Customer Type Paying Most VAT: The customer type with the highest average VAT payments is noted.
