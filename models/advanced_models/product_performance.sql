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

/*SELECT 
ps.product_id, 
ps.product_name, 
ps.total_sales, 
ps.total_orders, 
p.product_number, 
Sum(p.list_price) as TotalCost, 
p.modified_date from [Intermediate].[product_sales] ps
LEFT JOIN [Intermediate].[stg_products] p
ON p.product_id = ps.product_id
GROUP BY 
ps.product_id, 
ps.product_name, 
ps.total_sales, 
ps.total_orders, 
p.product_number, 
p.modified_date
*/