use retail_analytics

-- Top 10 Products by Revenue.

SELECT
    Description,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM retail_sales
GROUP BY Description
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Revenue by Country.

SELECT
    Country,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM retail_sales
GROUP BY Country
ORDER BY Total_Revenue DESC;

-- Monthly Revenue Trend

SELECT
    DATE_FORMAT(InvoiceDate,'%Y-%m') AS Month,
    ROUND(SUM(Revenue),2) AS Monthly_Revenue
FROM retail_sales
GROUP BY Month
ORDER BY Month;

-- Top 10 Products by Quantity Sold.

SELECT
    Description,
    SUM(Quantity) AS Total_Quantity
FROM retail_sales
GROUP BY Description
ORDER BY Total_Quantity DESC
LIMIT 10;

-- Average Revenue by Country.

SELECT
    Country,
    ROUND(AVG(Revenue),2) AS Average_Revenue
FROM retail_sales
GROUP BY Country
ORDER BY Average_Revenue DESC;

