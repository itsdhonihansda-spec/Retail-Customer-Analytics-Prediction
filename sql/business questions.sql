use retail_analytics

-- Which day of the week generates the highest revenue ?

SELECT
    DAYNAME(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS Day_Name,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM retail_sales
GROUP BY Day_Name
ORDER BY Total_Revenue DESC;

-- Which month generates the highest revenue ?

SELECT
    MONTHNAME(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS Month_Name,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM retail_sales
GROUP BY Month_Name
ORDER BY Total_Revenue DESC;

-- Which customers generated the highest revenue ?

SELECT
    CustomerID,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM retail_sales
WHERE CustomerID <> 0
GROUP BY CustomerID
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Which countries generated the highest revenue ?

SELECT
    Country,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM retail_sales
GROUP BY Country
ORDER BY Total_Revenue DESC;

-- Which countries placed the most orders ?

SELECT
    Country,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM retail_sales
GROUP BY Country
ORDER BY Total_Orders DESC;

-- What are the top 10 products by revenue ?

SELECT
    Description,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM retail_sales
GROUP BY Description
ORDER BY Total_Revenue DESC
LIMIT 10;

-- What are the top 10 products by quantity sold ?

SELECT
    Description,
    SUM(Quantity) AS Total_Quantity_Sold
FROM retail_sales
GROUP BY Description
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;

-- What is the monthly revenue trend ?

SELECT
    DATE_FORMAT(
        STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i'),
        '%Y-%m'
    ) AS Month,
    ROUND(SUM(Revenue), 2) AS Monthly_Revenue
FROM retail_sales
GROUP BY Month
ORDER BY Month;

-- What is the average order value by country ?

SELECT
    Country,
    ROUND(
        SUM(Revenue) / COUNT(DISTINCT InvoiceNo),
        2
    ) AS Average_Order_Value
FROM retail_sales
GROUP BY Country
ORDER BY Average_Order_Value DESC;