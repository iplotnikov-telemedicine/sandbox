connection: "io"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: companies {
  sql_always_where: ${companies.is_active} ;;

  join: companies_2021_info {
    relationship: one_to_one
    type: inner
    sql_on: ${companies.db_name} = ${companies_2021_info.schema_name} ;;
  }

  join: ca_turnover {
    relationship: one_to_many
    type: inner
    sql_on: ${companies.db_name} = ${ca_turnover.schema_name} ;;
  }
}


explore: kushagram_sales_by_date {
  join: offices {
    relationship: many_to_one
    type: left_outer
    sql_on: ${kushagram_sales_by_date.office_id} = ${offices.office_id} ;;
  }

}
