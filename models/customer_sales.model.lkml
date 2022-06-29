connection: "io"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: customer_sales_static {

  join: prod_companies {
    relationship: many_to_one
    sql_on:  ${customer_sales_static.comp_id} = ${prod_companies.comp_id} ;;
  }
}
