/*customer_lifetime_value
Purpose: Calculate the lifetime value of each customer. -- Aggregate total sales per customer

Steps:

Aggregate total sales per customer.
Count the number of orders per customer.


Output Requirements: The query should return the following columns:

customer_id: The unique identifier for each customer.
account_number: The account number of each customer.
lifetime_value: The total sales amount (total_due) aggregated for the customer.
total_orders: The total count of sales orders placed by the customer.
*/


select 
o.Customer_Id as CustomerID,
o.Account_Number as AccountNumber,
sum(o.Total_Due) as Lifetime_Value,
Count(o.Sales_Order_Id) as Total_Orders

from {{ref('customer_orders')}} o
LEFT JOIN {{ref('stg_customers')}} c on c.customer_id = o.Customer_Id
Group by o.Customer_Id, o.Account_Number
