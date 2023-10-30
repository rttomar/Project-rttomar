CREATE DATABASE SalesData;

CREATE TABLE sales_sample (
  Product_id SERIAL PRIMARY KEY,
  Region VARCHAR(50),
  Date DATE,
  Sales_Amount NUMERIC
);

INSERT INTO sales_sample (Region, Date, Sales_Amount)
VALUES
  ('East', '2023-01-05', 1000.00),
  ('West', '2023-01-10', 750.00),
  ('North', '2023-02-15', 1200.00),
  ('South', '2023-03-20', 900.00),
  ('East', '2023-04-25', 1100.00),
  ('West', '2023-05-30', 850.00),
  ('North', '2023-06-05', 1300.00),
  ('South', '2023-07-10', 950.00),
  ('East', '2023-08-15', 1050.00),
  ('West', '2023-09-20', 800.00);


SELECT Region, Product_id, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region, Product_id
ORDER BY Region, Product_id;

SELECT Region, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY ROLLUP (Region, Product_id)
ORDER BY Region, Product_id;


SELECT Region, Product_id, Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY CUBE (Region, Product_id, Date)
ORDER BY Region, Product_id, Date;


SELECT Region, Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
WHERE Region = 'East' AND Date BETWEEN '2023-04-01' AND '2023-06-30'
GROUP BY Region, Date
ORDER BY Date;

SELECT Region, Product_id, Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
WHERE Region = 'West' AND Product_id = 2 AND Date BETWEEN '2023-01-01' AND '2023-03-31'
GROUP BY Region, Product_id, Date
ORDER BY Date;
