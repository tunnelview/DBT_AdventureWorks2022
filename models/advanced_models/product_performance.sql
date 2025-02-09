/*product_performance
Purpose: Identify top-performing products based on profitability.

Steps:

Join product, sales, and inventory data.
Calculate profit by subtracting cost from sales.


Output Requirements: The query should return the following columns:

product_id: The unique identifier for each product.
product_name: The name of the product.
total_sales: The sum of sales amounts for the product.
total_cost: The sum of costs for the product.
profit: Calculated as total_sales - total_cost for the product
*/

{{ config(materialized='table') }}

SELECT
    p.product_id,
    p.product_name,
    SUM(sod.LineTotal) AS total_sales,
    SUM(sod.LineTotal - p.list_price * sod.OrderQty) AS profit,
    COUNT(DISTINCT soh.SalesOrderID) AS total_orders
FROM
    {{ ref('stg_products') }} p
LEFT JOIN
    AdventureWorks2022.Sales.SalesOrderDetail sod
ON
    p.product_id = sod.ProductID
LEFT JOIN
    AdventureWorks2022.Sales.SalesOrderHeader soh
ON
    sod.SalesOrderID = soh.SalesOrderID
GROUP BY
    p.product_id, p.product_name

