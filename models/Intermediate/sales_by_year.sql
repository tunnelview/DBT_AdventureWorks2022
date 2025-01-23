/*Create a dbt model query to calculate sales by year for trend analysis. The query should perform the following steps:

Extract the year from the sales date.
Aggregate the total sales amount for each year.
Input Details:

Sales data is available in a table sales_data with the following relevant columns:
sale_date: The date of each sale.
sale_amount: The amount of each sale.
Output Requirements: The query should return the following columns:

year: The year extracted from the sale_date column.
total_sales: The total sales amount aggregated for each year.
*/

{{config(materialized= 'table')}}

select 
	 Year(OrderDate) as 'Year'
	,round(sum(TotalDue),2) as Total_Sales
	,count(SalesOrderID) as Sales_Order_ID_Count
	from {{('source','SalesOrderHeader')}}
	Group by Year(OrderDate)
	Order by 'Year'