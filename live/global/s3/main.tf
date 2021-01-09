provider "aws" {
	region = "us-east-2"
}

resource "aws_instance" "example" {
	ami = "ami-0c55b159cbfafe1f0"
	instance_type = "t2.micro"
}

resource "aws_s3_bucket" "terraform_state" {
	bucket = "terraform-state-eageev"

	lifecycle {
		prevent_destroy = true
	}

	versioning {
		enabled = true
	}

	server_side_encryption_configuration {
		rule {
			apply_server_side_encryption_by_default {
				sse_algorithm = "AES256"
			}
		}
	}
}

resource "aws_dynamodb_table" "terraform_locks" {
	name = "terraform-locks-eageev"
	billing_mode = "PAY_PER_REQUEST"
	hash_key = "LockID"

	attribute {
		name = "LockID"
		type = "S"
	}
}

terraform {
	backend "s3" {
		bucket  = "terraform-state-eageev"
		key = "global/s3/terraform.tfstate"
		region = "us-east-2"

		dynamodb_table = "terraform-locks-eageev"
		encrypt = true
	}
}
