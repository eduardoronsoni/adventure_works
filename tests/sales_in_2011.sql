SELECT 
    SUM(od.ORDER_QTY * od.UNIT_PRICE) AS total_sales
FROM 
    {{ ref('int_sales__order_details') }} as od
JOIN 
     {{ ref('int_sales__orders') }} as o
    ON od.fk_order_id = o.pk_order_id
WHERE 
    EXTRACT(YEAR FROM CAST(o.order_date AS DATE)) = 2011
HAVING 
   ABS(SUM(od.ORDER_QTY * od.UNIT_PRICE) - 12646112.16) > 0.01