# Environment
environment = "dev"

#VPC
vpc_name = "anr-vpc"
vpc_cidr_block = "10.0.0.0/16"
vpc_availability_zones = ["us-east-1a", "us-east-1b"]
vpc_public_subnets = ["10.0.10.0/24", "10.0.11.0/24"]
vpc_private_subnets = ["10.0.20.0/24", "10.0.21.0/24"]
vpc_database_subnets= ["10.0.30.0/24", "10.0.31.0/24"]
vpc_create_database_subnet_group = true 
vpc_create_database_subnet_route_table = true   
vpc_enable_nat_gateway = true  
vpc_single_nat_gateway = true

# EC2 Instance Variables
instance_type = "t3.micro"
instance_keypair = "terraform-key"
private_instance_count = 2

# AWS Load Balancer Variables
dns_name = "dev.sakthimakil.com"
