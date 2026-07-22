/*
Project: Retail Customer Analytics & Prediction

Phase: Business SQL Analysis

Author: Dhoni Hansda
*/

use retail_analytics;

-- Total Revenue

SELECT
    ROUND(SUM(Revenue),2) AS Total_Revenue
FROM retail_sales;

-- Total Orders

SELECT
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM retail_sales;

-- Total Customers

SELECT
    COUNT(DISTINCT CustomerID) AS Total_Customers
FROM retail_sales
WHERE CustomerID <> 0;

-- Average Order Value

SELECT
    ROUND(
        SUM(Revenue) /
        COUNT(DISTINCT InvoiceNo),
        2
    ) AS Average_Order_Value
FROM retail_sales;

-- Top 10 Products by Revenue

SELECT
    Description,
    ROUND(SUM(Revenue),2) AS Total_Revenue
FROM retail_sales
GROUP BY Description
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Top 10 Customers

SELECT
    CustomerID,
    ROUND(SUM(Revenue),2) AS Total_Revenue
FROM retail_sales
WHERE CustomerID <> 0
GROUP BY CustomerID
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Revenue by Country

SELECT
    Country,
    ROUND(SUM(Revenue),2) AS Total_Revenue
FROM retail_sales
GROUP BY Country
ORDER BY Total_Revenue DESC;

-- Monthly Revenue Trend

SELECT
    DATE_FORMAT(STR_TO_DATE(InvoiceDate,'%Y-%m-%d %H:%i:%s'),'%Y-%m') AS Month,
    ROUND(SUM(Revenue),2) AS Monthly_Revenue
FROM retail_sales
GROUP BY Month
ORDER BY Month;

-- Top 10 Products by Quantity Sold

SELECT
    Description,
    SUM(Quantity) AS Total_Quantity
FROM retail_sales
GROUP BY Description
ORDER BY Total_Quantity DESC
LIMIT 10;

-- Average Revenue by Country

SELECT
    Country,
    ROUND(AVG(Revenue),2) AS Average_Revenue
FROM retail_sales
GROUP BY Country
ORDER BY Average_Revenue DESC;