with
    business_entities as (
        select *
        from {{ source('erp', 'businessentity') }}
    )

    , renamed as (
        select 
            cast(BUSINESSENTITYID as string) as pk_business_entity_id
            , cast(ROWGUID as string) as row_guid
            , cast(MODIFIEDDATE as date) as modified_date
        from business_entities
    )

select *
from renamed