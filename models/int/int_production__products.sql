with 
    products as (
        select *
        from {{ ref('stg_erp__products') }}
    )

    , product_categories as ( 
        select *
        from {{ ref('stg_erp__product_categories') }}
    )

    ,  product_subcategories as (
        select *
        from {{ ref('stg_erp__product_subcategories') }}
    )

    , product_enrichment as (
        select 
            products.PK_PRODUCT_ID
            , product_categories.PK_PRODUCT_CATEGORY_ID
            , products.FK_PRODUCT_SUBCATEGORY_ID
            , products.PRODUCT_NAME
            , product_subcategories.PRODUCT_SUBCATEGORY_NAME
            , product_categories.PRODUCT_CATEGORY_NAME
            , products.PRODUCT_NUMBER
            , products.STD_COST
            , products.LIST_PRICE
        from products
        left join product_subcategories on products.FK_PRODUCT_SUBCATEGORY_ID = product_subcategories.pk_product_subcategory_id
        left join product_categories on product_subcategories.fk_product_category_id = product_categories.pk_product_category_id
    )

select *
from product_enrichment
