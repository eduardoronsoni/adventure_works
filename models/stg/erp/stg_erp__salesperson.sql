with 
    sales_person as (
        select *
        from {{ source('erp', 'salesperson') }}
    )

    , renamed as (
        select
            cast(BUSINESSENTITYID as string) as pk_business_entity_id
            , cast(TERRITORYID as string) as fk_territory_id
            , cast(ROWGUID as string) as row_guid
            , cast(SALESYTD as numeric(18,2)) as sales_ytd
            , cast(SALESLASTYEAR as numeric(18,2)) as sales_ly
            , cast(MODIFIEDDATE as date) as modified_Date
        from sales_person
    )

select * from renamed

