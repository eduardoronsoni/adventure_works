with
    product_categories as (
        select *
        from {{ source('erp', 'productcategory') }}
    )

    , renamed as (
        select
        cast(PRODUCTCATEGORYID as string) as pk_product_category_id
        , cast(ROWGUID as string) as row_guid
        , cast(NAME as string) as product_category_name
        , cast(MODIFIEDDATE as date) as modified_date
        from product_categories
    )

select *
from renamed