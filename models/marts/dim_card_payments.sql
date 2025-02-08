with
    int_card_payments as (
        select *
        from {{ ref('int_sales__card_payments') }}
    )

select * from int_card_payments