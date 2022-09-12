variable "databricks_connection_profile" {
  description = "The name of the Databricks connection profile to use."
  type = string
  default = "cust-success"
}

variable token{
    description = "The token to use for the connection."
    type = string
    default= "dapi199f4ac1c01e4e6520365954a895a6a1"
}