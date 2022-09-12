variable "databricks_connection_profile" {
  description = "The name of the Databricks connection profile to use."
  type = string
  default = "DEFAULT"
}

variable token{
    description = "The token to use for the connection."
    type = string
    default= "dapid2912dd705d6b6100c72d9adaa5699d0-3"
}