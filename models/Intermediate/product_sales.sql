/*Question:

Write a dbt model query to compute the following metrics for each product in a dataset:

Total Sales: The sum of the LineTotal column from the SalesOrderDetail table for each product.
Total Orders: The count of distinct SalesOrderID from the SalesOrderHeader table for each product.
Data Details:

Products are stored in a table stg_products with columns product_id and product_name.
Sales details are available in the SalesOrderDetail table, linked to stg_products using the ProductID column.
Sales order headers are stored in the SalesOrderHeader table, linked to SalesOrderDetail using the SalesOrderID column.*/

{{config(materialized='table')}}

/*--Incorrect code as self joined the same table, didn't use raw or source
	select 
	s.ProductID, 
	p.Name,
	Round(sum(s.LineTotal),2) as TotalSales,
	Sum(s.SalesOrderID) as Total_Sales_Order_Count
	from {{ref('stg_products')}} s
	Left join {{ref('stg_products')}} p
	on p. ProductID = s.ProductID
	Group by s.ProductID, p.Name */

  
  SELECT
    p.product_id,
    p.product_name,
    SUM(sod.LineTotal) AS total_sales,
    COUNT(DISTINCT soh.SalesOrderID) AS total_orders
FROM
    {{ref('stg_products')}} p
LEFT JOIN
    {{source('AdventureWorks2022', 'SalesOrderDetail')}} sod
ON
    p.product_id = sod.ProductID
LEFT JOIN
    {{source('AdventureWorks2022','SalesOrderHeader')}} soh
ON
    sod.SalesOrderID = soh.SalesOrderID
GROUP BY
    p.product_id, p.product_name

