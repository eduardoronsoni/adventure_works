with 
    sales_order_details as (
        select *
        from {{ source('erp', 'salesorderdetail') }}
    )

    , renamed as (
        select
            cast(SALESORDERDETAILID as string) as pk_order_details_id
            , cast(SALESORDERID as string) as fk_order_id
            , cast(PRODUCTID as string) as fk_product_id
            , cast(SPECIALOFFERID as string) as fk_offer_id
            , cast (ROWGUID as string ) as row_guid 
            , cast(CARRIERTRACKINGNUMBER as string) as  tracking_number
            , cast(ORDERQTY as int) as order_qty
            , cast(UNITPRICE as numeric(18,6)) as unit_price
            , cast(UNITPRICEDISCOUNT as numeric(18,2)) as unit_price_discount
            , cast(MODIFIEDDATE as date) as modified_date
        from sales_order_details
    )

select *
from renamed

