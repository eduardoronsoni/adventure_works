with
    product_subcategories as (
        select *
        from {{ source('erp', 'productsubcategory') }}
    )

    , renamed as (
        select 
            cast(PRODUCTSUBCATEGORYID as string) as pk_product_subcategory_id
            , cast(PRODUCTCATEGORYID as string) as fk_product_category_id
            , cast(ROWGUID as string) as row_guid
            , cast(NAME as string) as product_subcategory_name
            , cast(MODIFIEDDATE as date) as modified_date
        from product_subcategories
    )

select * 
from renamed