USE retail_analytics;


CREATE TABLE retail_sales (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate VARCHAR(30),
    UnitPrice DECIMAL(10,2),
    CustomerID VARCHAR(20), 
    Country VARCHAR(100),
    Revenue DECIMAL(12,2)
);

SHOW TABLES;

DESCRIBE retail_sales;