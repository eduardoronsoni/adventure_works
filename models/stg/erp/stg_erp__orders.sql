with 
    sales_orders_header as (
    select *
    from {{ source('erp', 'salesorderheader') }}
)

    , renamed as (
        select        
            cast(SALESORDERID as string) as pk_order_id
            , cast (TERRITORYID as string) as fk_territory_id
            , cast (BILLTOADDRESSID as string ) as fk_bill_to_address_id
            , cast (CUSTOMERID as string) as fk_customer_id
            , cast (SHIPTOADDRESSID as string ) as fk_ship_to_adress_id
            , cast (SHIPMETHODID as string ) as fk_ship_method_id
            , cast (CREDITCARDID as string ) as fk_credit_card_id
            , cast (CURRENCYRATEID as string ) as fk_currency_rate_id
            , cast (ROWGUID as string ) as row_guid 
            , cast (REVISIONNUMBER as string) as revision_number
            , cast (ORDERDATE as date) as order_date
            , cast (DUEDATE as date) as due_date
            , cast (SHIPDATE as date ) as ship_date
            , cast (STATUS as string) as order_status
            , cast (ONLINEORDERFLAG as boolean) as online_order_flag -- POSSIVELMENTE MELHORAR, VER COMO TRATAM BOOLEANO
            , cast (PURCHASEORDERNUMBER as string) as purchase_order_number
            , cast (ACCOUNTNUMBER as string) as account_number
            , cast (SALESPERSONID as string ) as sales_person_id
            , cast (CREDITCARDAPPROVALCODE as string ) as credit_card_approval_code
            , cast (SUBTOTAL as numeric(18,2) ) as subtotal
            , cast (TAXAMT as numeric(18,2) ) as tax_amount
            , cast (FREIGHT as numeric(18,2) ) as freight
            , cast (TOTALDUE as numeric(18,2) ) as total_due
            , cast (COMMENT as string ) as comment

            , cast (MODIFIEDDATE as date ) as modified_date
        from sales_orders_header
                )

select * 
from renamed