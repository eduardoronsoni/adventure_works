with 
    stores as (
        select *
        from {{ source('erp', 'store') }}
    ),

    renamed as (
        select 
            cast(BUSINESSENTITYID as string) as pk_store_id
            ,cast(SALESPERSONID as string) as fk_sales_person_id
            ,cast(NAME as string) as store_name
            ,cast(ROWGUID as string) as row_guid
            ,cast(MODIFIEDDATE as date ) as modified_date
        from stores
    )

select *
from renamed