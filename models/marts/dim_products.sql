with int_products as (
    select *
    from {{ ref('int_production__products') }}
)

select *
from int_products