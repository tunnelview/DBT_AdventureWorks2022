--Who are the top 10 customers by total lifetime sales revenue?
--This is the staging model.

{{ config(materialized='table') }}

with stg_customers as (
SELECT
    CustomerID AS customer_id,
    PersonID AS person_id,
    TerritoryID AS territory_id,
    AccountNumber AS account_number,
    ModifiedDate AS modified_date
FROM
    {{ source('AdventureWorks2022', 'customer') }}
)

	Select * from stg_customers;