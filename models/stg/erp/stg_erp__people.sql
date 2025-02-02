with
    person as (
        select *
        from {{ source('erp', 'person') }}
    )

    , renamed as (
        select 
            cast (BUSINESSENTITYID as string) as pk_business_entity_id
            , concat(FIRSTNAME, ' ', MIDDLENAME, ' ', LASTNAME) as full_name
            , cast (ROWGUID as string) as row_guid
            , cast (MODIFIEDDATE as date) as modified_date
        from person
    )

select *
from renamed