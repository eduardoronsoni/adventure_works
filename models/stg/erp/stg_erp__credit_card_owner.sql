with 
    credit_card_owner as (
        select *
        from {{ source('erp', 'personcreditcard') }}
    ),

    renamed as (
        select
            cast(BUSINESSENTITYID as string) as pk_person_id
            , cast(CREDITCARDID as string) as fk_credit_card_id
            , cast(MODIFIEDDATE as date) as modified_date
        from credit_card_owner
    )

select *
from renamed