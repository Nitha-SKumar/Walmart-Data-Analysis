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
