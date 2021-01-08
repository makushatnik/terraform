output "address" {
	value = aws_db_instance.example.address
	description = "Database address"
}

output "port" {
	value = aws_db_instance.example.port
	description = "Database port"
}
