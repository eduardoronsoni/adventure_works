with
    products as (
        select *
        from {{ source('erp', 'product') }}
    )

    , renamed as (
        select
            cast(PRODUCTID as string) as pk_product_id
            ,cast(PRODUCTSUBCATEGORYID as string) as fk_product_subcategory_id
            ,cast(ROWGUID as string) as row_guid
            ,cast(NAME as string) as product_name
            ,cast(PRODUCTNUMBER as string) as product_number
            ,cast(STANDARDCOST as numeric(18,2)) as std_cost
            ,cast(LISTPRICE as numeric(18,2)) as list_price
            ,cast(WEIGHT as numeric(18,2)) as product_weight
            ,cast(CLASS as string) as product_class
            ,cast(STYLE as string) as product_style
            ,cast(MODIFIEDDATE as date) as modified_date
        from products
    )

select *
from renamed
