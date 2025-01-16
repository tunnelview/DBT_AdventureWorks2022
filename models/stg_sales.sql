--stg_sales.sql

{{config(materialized= 'table')}}

with stg_sales as (
    SELECT 
    SalesOrderID AS sales_order_id,
    CustomerID AS customer_id,
    OrderDate AS order_date,
    TerritoryID AS territory_id,
    TotalDue AS total_due,
    SalesPersonID AS sales_person_id,
    ModifiedDate AS modified_date
FROM
    AdventureWorks2022.Sales.SalesOrderHeader)
   
Select * from  stg_sales;
