--stg_inventory.sql
--Two columns not present in the actual table


{{config(materialized = 'table')}};

With stg_inventory as ()
SELECT
    ProductID AS product_id,
    LocationID AS warehouse_id,
    Quantity AS stock_quantity,
    SafetyStockLevel AS safety_stock_level,
    ReorderPoint AS reorder_point,
    ModifiedDate AS modified_date
FROM
    AdventureWorks2022.Production.ProductInventory)

    Select * from stg_inventory;