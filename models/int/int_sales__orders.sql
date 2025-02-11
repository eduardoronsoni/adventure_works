with 
    orders as (
        select *
        from {{ ref('stg_erp__orders') }}
    ),

    order_details as (
        select *
        from {{ ref('stg_erp__order_details') }}
    )

    , discount_order as (
        select 
            fk_order_id,
            max(UNIT_PRICE_DISCOUNT) as max_discount
        from order_details
        group by fk_order_id
    )

    , metrics as (
        select 
            PK_ORDER_ID
            , orders.FK_TERRITORY_ID
            , orders.FK_BILL_TO_ADDRESS_ID
            , orders.FK_CUSTOMER_ID
            , orders.FK_SHIP_TO_ADRESS_ID
            , orders.FK_SHIP_METHOD_ID
            , orders.FK_CREDIT_CARD_ID
            , orders.ORDER_DATE
            , orders.DUE_DATE
            , orders.SHIP_DATE
            , orders.ORDER_STATUS
            , orders.ONLINE_ORDER_FLAG
            , orders.SALES_PERSON_ID
            , orders.SUBTOTAL
            , orders.TAX_AMOUNT
            , orders.FREIGHT
            , orders.TOTAL_DUE
            , case when 
                    discount_order.max_discount > 0 then true
                    else false 
                    end as order_has_discount
from orders
left join discount_order on orders.pk_order_id = discount_order.fk_order_id)

select * 
from metrics
