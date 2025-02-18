with 
    sales_reason as (
        select *
        from {{ ref('stg_erp__sales_reason') }}
    )

    , sales_order_sales_reason as (
        select *
        from {{ ref('stg_erp__sales_order_sales_reason') }}
    )


    , ranking_reasons as (
        select 
            sales_order_sales_reason.FK_SALES_ORDER_ID as PK_SALES_ORDER_ID
            ,sales_order_sales_reason.FK_SALES_REASON_ID 
            , sales_reason.SALES_REASON
            , sales_reason.SALES_REASON_TYPE
            , row_number() over (partition by PK_SALES_ORDER_ID order by sales_order_sales_reason.MODIFIED_DATE desc, FK_SALES_REASON_ID) as reason_rank
        from sales_order_sales_reason
        left join sales_reason on sales_order_sales_reason.FK_SALES_REASON_ID = sales_reason.PK_SALES_REASON_ID
    )


    , pivoting_reasons as (
        select 
            PK_SALES_ORDER_ID
            , max(case when reason_rank = 1 then SALES_REASON end) as sales_reason_1
            , max(case when reason_rank = 2 then SALES_REASON end) as sales_reason_2
            , max(case when reason_rank = 3 then SALES_REASON end) as sales_reason_3
        from ranking_reasons
        group by 
            PK_SALES_ORDER_ID
    )

    select
        PK_SALES_ORDER_ID
        , sales_reason_1
        , sales_reason_2
        , sales_reason_3
    from pivoting_reasons