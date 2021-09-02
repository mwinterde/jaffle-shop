{{
    config(
        materialized = "incremental",
        partition_by = {
            "field": "order_date",
            "data_type": "date",
            "granularity": "day"
        }
    )
}}

select
    order_date,
    count(order_id) as number_of_orders
from {{ ref('stg_orders') }}
where order_date = PARSE_DATE("%Y%m%d", CAST({{ var('order_date') }} AS STRING))
group by 1