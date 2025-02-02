with
    address as (
        select *
        from {{ source('erp', 'address') }}
    )

    , renamed as (
        select
            cast(ADDRESSID as string) as pk_address_id
            , cast(STATEPROVINCEID as string) as fk_state_province_id
            , cast(ROWGUID as string) as row_guid
            , cast(CITY as string) as city
            , cast(POSTALCODE as string) as string
            , cast(MODIFIEDDATE as date) as modified_date
        from
        address
    )

select * 
from renamed