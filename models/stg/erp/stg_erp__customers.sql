with
    customers as (
        select *
        from {{ source('erp', 'customer') }}
    )

    , renamed as (
        select
            cast(CUSTOMERID as string) as pk_customer_id
            , cast(PERSONID as string) as fk_person_id
            , cast(STOREID as string) as fk_store_id
            , cast(TERRITORYID as string) as fk_territory_id
            , cast(ROWGUID as string) as row_guid
            , cast(MODIFIEDDATE as date) as modified_date
        from customers
    )

    select *
    from renamed