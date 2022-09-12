variable "databricks_connection_profile" {
  description = "The name of the Databricks connection profile to use."
  type = string
  default = "cust-success"
}
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
  host = "https://cust-success.cloud.databricks.com"
  token = var.token
  }



resource "databricks_group" "group" {
    allow_cluster_create       = true
    allow_instance_pool_create = true
    databricks_sql_access      = true
    display_name               = "testing_simran"
<<<<<<< HEAD
    workspace_access           = true
=======
    workspace_access           = true`
>>>>>>> 554a2f1f813c714bd6baa92d947e4a6911f78b02
   force		= true
}


resource "databricks_group_instance_profile" "all" {
  group_id            = databricks_group.group.id
  instance_profile_id = "arn:aws:iam::265388553628:instance-profile/cedric-databricks-3-role"
}


