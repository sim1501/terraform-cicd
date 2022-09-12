
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
  host = "https://adb-8596220602934265.5.azuredatabricks.net"
  token = var.token
  }



resource "databricks_group" "group" {
    allow_cluster_create       = true
    allow_instance_pool_create = true
    databricks_sql_access      = true
    display_name               = "testing_simran"
    workspace_access           = true
    force		               = true
}


# resource "databricks_group_instance_profile" "all" {
#   group_id            = databricks_group.group.id
#   instance_profile_id = "arn:aws:iam::265388553628:instance-profile/cedric-databricks-3-role"
# }


