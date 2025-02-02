with
    credit_cards as (
        select *
        from {{ source('erp', 'creditcard') }}
    )

    , renamed as (
        select 
            cast(CREDITCARDID as string) as pk_credit_card_id
            , cast(CARDTYPE as string) as card_type
            , cast(CARDNUMBER as string) as card_number
            , cast(concat(lpad(EXPMONTH, 2, '0'), '/', EXPYEAR) as string) AS expiring_date
            , cast(MODIFIEDDATE as date) as modified_date
        from 
            credit_cards
    )

select *
from renamed