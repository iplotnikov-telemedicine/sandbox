view: kushagram_sales_by_date {
  derived_table: {
    sql:
        select
            a.office_id,
            coalesce(offices.office_name, 'Unknown name') as office_name,
            sum(order_total_sum)/sum(order_count) as daily_avg_order_amount,
            avg(order_total_sum) as daily_avg_order_sum,
            avg(order_count) as daily_avg_order_count
        from (
            select
                office_id,
                DATE(sync_created_at) as date_of_creation,
                sum(total_amount) as order_total_sum,
                count(*) as order_count
            from c3628_company.warehouse_orders wo
            where sync_created_at >= '2022-01-01'
                and confirmed_at is not null
            group by 1,2
        ) a
        left join backend.offices
        on a.office_id = offices.office_id
        group by 1, 2 ;;
  }

  dimension: office_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.office_id ;;
  }

  dimension: office_name {
    type: string
    sql: ${TABLE}.office_name ;;
  }

  dimension: daily_avg_order_amount {
    type: number
    value_format_name:  usd_0
    sql: ${TABLE}.daily_avg_order_amount ;;
  }

  dimension: daily_avg_order_sum {
    type: number
    value_format_name:  usd_0
    sql: ${TABLE}.daily_avg_order_sum ;;
  }

  dimension: daily_avg_order_count {
    type: number
    value_format_name: decimal_1
    sql: ${TABLE}.daily_avg_order_count ;;
  }




}
