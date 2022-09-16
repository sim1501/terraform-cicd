
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }

    databricks = {
      source = "databricks/databricks"
    }
  }
}

provider "databricks" {
  # profile = var.databricks_connection_profile
  account_id = ""
  host       = "https://adb-8596220602934265.5.azuredatabricks.net"
  token      = var.token
}



/*resource "databricks_group" "group" {
    allow_cluster_create       = true
    allow_instance_pool_create = true
    databricks_sql_access      = true
    display_name               = "testing_simran"
    workspace_access           = true
    force		               = true
}*/


# resource "databricks_group_instance_profile" "all" {
#   group_id            = databricks_group.group.id
#   instance_profile_id = "arn:aws:iam::265388553628:instance-profile/cedric-databricks-3-role"
# }

resource "databricks_sql_query" "q1" {
  data_source_id = "676432a6-c8bd-4bab-9e3b-7e8e51085f64"
  name           = "My Working Project"
  query          = "SELECT * from simran_test.customers"
  

}

resource "databricks_sql_visualization" "q1v1" {
  query_id    = databricks_sql_query.q1.id
  type        = "table"
  name        = "My Table"
  description = "Some Description in progress"

  // The options encoded in this field are passed verbatim to the SQLA API.
  options = jsonencode(

 {   "alignYAxesAtZero" : false,
    "coefficient" : 1,
    "columnConfigurationMap" : {
      "series" : {
        "column" : "AccountId",
        "id" : "column_7915eaf48"
      },
      "x" : {
        "column" : "vertical",
        "id" : "column_7915eaf47"
      },
      "y" : [
        {
          "column" : "dollar_ammount",
          "id" : "column_7915eaf49",
          "transform" : "SUM"
        }
      ]
    },
    "dateTimeFormat" : "YYYY-MM-DD HH:mm",
    "direction" : {
      "type" : "counterclockwise"
    },
    "error_y" : {
      "type" : "data",
      "visible" : true
    },
    "globalSeriesType" : "pie",
    "legend" : {
      "traceorder" : "normal"
    },
    "missingValuesAsZero" : true,
    "numberFormat" : "0,0[.]00000",
    "percentFormat" : "0[.]00%",
    "series" : {
      "error_y" : {
        "type" : "data",
        "visible" : true
      },
      "stacking" : "stack"
    },
    "seriesOptions" : {
      "column_7915eaf49" : {
        "name" : "dollar_ammount",
        "type" : "pie",
        "yAxis" : 0
      }
    },
    "showDataLabels" : true,
    "sizemode" : "diameter",
    "sortX" : true,
    "sortY" : true,
    "swappedAxes" : false,
    "textFormat" : "",
    "useAggregationsUi" : true,
    "valuesOptions" : {},
    "version" : 2,
    "xAxis" : {
      "labels" : {
        "enabled" : true
      },
      "type" : "-"
    },
    "yAxis" : [
      {
        "type" : "-"
      },
      {
        "opposite" : true,
        "type" : "-"
      }
    ]

  }
  )
}