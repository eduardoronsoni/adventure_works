with 
    customers as (
        select *
        from {{ ref('stg_erp__customers') }}
    )


    , people as (
        select *
        from {{ ref('stg_erp__people') }}
    )


    , stores as (
        select * 
        from {{ ref('stg_erp__stores') }}
    )


select 
    customers.pk_customer_id
    , customers.fk_person_id
    , customers.fk_store_id
    , customers.fk_territory_id
    , stores.fk_sales_person_id
    , people.person_full_name
    , stores.store_name
from customers
left join people on customers.fk_person_id = people.pk_person_id
left join stores on customers.fk_store_id = stores.pk_store_id

