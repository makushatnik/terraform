variable "server_port" {
	description = "The server port"
	type = number
	default = 8080
}

variable "cluster_name" {
	description = "the name of cluster"
	type = string
}

variable "db_remote_state_bucket" {
	description = "The DB's remote state"
	type = string
}

variable "db_remote_state_key" {
	description = "The path for the DB's remote state in S3"
	type = string
}