{{
    config(
        partition_by = {
            "field": "order_date",
            "data_type": "date",
            "granularity": "day"
        }
    )
}}

select
    id as order_id,
    user_id as customer_id,
    order_date,
    status

from `dbt-tutorial`.jaffle_shop.orders