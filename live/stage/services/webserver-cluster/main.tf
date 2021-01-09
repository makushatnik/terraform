provider "aws" {
	region = "us-east-2"
}

module "webserver_cluster" {
	source = "../../../../modules/services/webserver-cluster"

	cluster_name = "webservers-stage"
	db_remote_state_bucket = "terraform-state-eageev"
	db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"
}

resource "aws_security_group_rule" "allow_testing_inbound" {
	type 			  = "ingress"
	security_group_id = module.webserver_cluster.alb_security_group_id

	from_port   = local.test_port
	to_port     = local.test_port
	protocol    = local.tcp_protocol
	cidr_blocks = local.all_ips
}

locals {
	test_port = 12345
	tcp_protocol = "tcp"
	all_ips = ["0.0.0.0/0"]
}