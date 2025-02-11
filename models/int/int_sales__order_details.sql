with
    order_details as (
        select *
        from {{ ref('stg_erp__order_details') }}
    )

    , orders as (
        select * from {{ ref('stg_erp__orders') }}
    )


    , joined as (
        select 
            order_details.PK_ORDER_DETAILS_ID
            , order_details.FK_ORDER_ID
            , order_details.FK_PRODUCT_ID
            , order_details.FK_OFFER_ID
            , order_details.ROW_GUID
            , order_details.TRACKING_NUMBER
            , order_details.ORDER_QTY
            , order_details.UNIT_PRICE
            , order_details.UNIT_PRICE_DISCOUNT
            , orders.FREIGHT
        from order_details
        left join orders on order_details.fk_order_id = orders.pk_order_id
    )


    , metrics as (
        select
            PK_ORDER_DETAILS_ID
            , FK_ORDER_ID
            , FK_PRODUCT_ID
            , FK_OFFER_ID
            , ORDER_QTY
            , UNIT_PRICE
            , UNIT_PRICE_DISCOUNT
            , case when 
                    UNIT_PRICE_DISCOUNT > 0 then TRUE
                    else FALSE end as product_has_discount
            , ORDER_QTY*(1 - UNIT_PRICE_DISCOUNT)*UNIT_PRICE as product_total
            , cast(FREIGHT/ count(*) over (partition by fk_order_id) as numeric(18,2)) as partial_freight
        from joined
    )

    select 
        *
    from metrics
    