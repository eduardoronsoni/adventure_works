with
    credit_cards as (
        select *
        from {{ ref('stg_erp__credit_cards') }}
    )

    , credit_card_owner as (
        select *
        from {{ ref('stg_erp__credit_card_owner') }}
    )

    , people as (
        select *
        from {{ ref('stg_erp__people') }}
    )


    , joined as (
        select 
            credit_cards.PK_CREDIT_CARD_ID
            , credit_cards.CARD_TYPE
            , credit_cards.CARD_NUMBER
            , credit_cards.EXPIRING_DATE
            , people.pk_person_id as fk_person_id
            , people.person_full_name as card_owner
        from credit_cards
        left join credit_card_owner on credit_cards.pk_credit_card_id = credit_card_owner.fk_credit_card_id
        left join people on credit_card_owner.pk_person_id = people.pk_person_id
    )

select *
from joined
