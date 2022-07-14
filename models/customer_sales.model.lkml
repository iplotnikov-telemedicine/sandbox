connection: "io"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: customer_patients {}

explore: customer_products {}

explore: customer_registers {}

explore: customer_sales {}

explore: customer_history {}

explore: customers {
  from: prod_companies

  join: customer_history {
    relationship: one_to_one
    sql_on:  ${customers.comp_id} = ${customer_history.comp_id} ;;
  }

  join: customer_offices {
    relationship: one_to_one
    sql_on:  ${customers.comp_id} = ${customer_offices.office_comp_id} ;;
  }

  join: country {
    relationship: many_to_one
    sql_on:  ${customers.country_id} = ${country.id} ;;
  }

  join: patients_by_customer {
    relationship: one_to_one
    sql_on:  ${customers.comp_id} = ${patients_by_customer.comp_id} ;;
  }

  join: products_by_customer {
    relationship: one_to_one
    sql_on:  ${customers.comp_id} = ${products_by_customer.comp_id} ;;
  }

  join: registers_by_customer {
    relationship: one_to_one
    sql_on:  ${customers.comp_id} = ${registers_by_customer.comp_id} ;;
  }

  join: subscription_plans {
    from: package
    relationship: many_to_one
    sql_on:  ${customers.plan_id} = ${subscription_plans.id} ;;
  }

  join: offices {
    relationship: one_to_many
    sql_on:  ${customers.comp_id} = ${offices.office_comp_id} ;;
  }

  join: customer_sales {
    relationship: one_to_many
    sql_on:  ${customers.comp_id} = ${customer_sales.comp_id} ;;
  }
}
