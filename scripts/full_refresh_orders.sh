#!/usr/bin/bash

# drop table
bq rm -f jaffle_shop.orders

# transform input dates
start=$1
end=$2
start=$(gdate -d $start +%Y%m%d)
end=$(gdate -d $end +%Y%m%d)

# create incremental dbt model for each individual day
while [[ $start -le $end ]]
do
	dbt run --models orders --vars "{order_date: $start}"
	start=$(gdate -d "$start + 1 day" +"%Y%m%d")
done