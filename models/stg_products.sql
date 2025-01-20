
--stg_products
--Creating this stging_model

{{ config(materialized='table') }}

with stg_products as (SELECT
    ProductID AS product_id,
    Name AS product_name,
    ProductNumber AS product_number,
    ListPrice AS list_price,
    ModifiedDate AS modified_date
FROM
        {{ source('Shibin', 'Product') }}
WHERE
    ListPrice > 0)

    Select * from stg_products;


