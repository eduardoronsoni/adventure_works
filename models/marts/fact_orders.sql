with 
    int_orders as (
        select *
        from {{ ref('int_sales__orders') }}
    )

select * from int_orders