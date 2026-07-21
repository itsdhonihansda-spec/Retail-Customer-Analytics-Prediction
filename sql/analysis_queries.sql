USE retail_analytics;

-- Total Revenue

SELECT
    ROUND(SUM(Revenue), 2) AS Total_Revenue
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
    ROUND(SUM(Revenue) / COUNT(DISTINCT InvoiceNo), 2) AS Average_Order_Value
FROM retail_sales;

