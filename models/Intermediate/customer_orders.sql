--Purpose
-- Purpose: Join customer and sales data to analyze orders by customers.
-- Created this model by using stg_customers and stg_sales to get for the 
--analyses orders by customers.

{{config(materialized='table')}}

with customer_orders as  (
Select   
c.Customer_id	 as	Customer_Id,
c.Account_number as Account_Number,
s.territory_id	 as	Territory_Id,
s.sales_order_id as Sales_Order_Id,
s.order_date	 as		Order_Date,
s.total_due		 as		Total_Due
from {{ref('stg_customers')}} as c
left join {{ref('stg_sales')}}  s 
on s.customer_id = c.customer_id
)

select * from customer_orders;
