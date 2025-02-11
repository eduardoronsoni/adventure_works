with 
    int_customers as (
        select *
        from {{ ref('int_sales__customers') }}
    )

select * from int_customers