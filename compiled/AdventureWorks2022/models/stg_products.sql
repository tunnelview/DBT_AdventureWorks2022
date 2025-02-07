--stg_products
--Creating this stging_model



with stg_products as (
    SELECT
    ProductID AS product_id,
    [Name] AS product_name,
    ProductNumber AS product_number,
    ListPrice AS list_price,
    ModifiedDate AS modified_date
FROM
        "AdventureWorks2022"."Production"."Product"
WHERE
    ListPrice > 0)

    Select * from stg_products;