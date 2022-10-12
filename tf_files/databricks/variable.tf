variable "databricks_connection_profile" {
  description = "The name of the Databricks connection profile to use."
  type        = string
  default     = "cust-success"
}

variable "token" {
  description = "The token to use for the connection."
  type        = string
  default     = "dapi199f4ac1c01e4e6520365954a895a6a1"

}

variable "service_principal_display_name" {
  description = "The display name for the service principal."
  type        = string
}

variable "service_principal_access_token_lifetime" {
  description = "The lifetime of the service principal's access token, in seconds."
  type        = number
  default     = 3600
}
variable "listOfPythonPackages" {
  type = list(string)
  
  default = [ "pandas","databricks-cli" ]
  
}
variable "listOfMavenPackages" {
  type = list(string)
  
  default = [ "com.google.guava:guava:23.0" , "com.google.protobuf:protobuf-java-util:3.17.3" ]
}

variable "factset_api_credentials" {
  type = object({
   name = string,
   class = string
  })
  default = {
    class = "five"
    name = "simmi"
  }
}