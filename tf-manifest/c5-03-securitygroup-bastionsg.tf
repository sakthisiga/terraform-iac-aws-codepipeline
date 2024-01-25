# Security Groups Bastion host
module "public_bastion_sg" {
  # Mandatory parameters
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.2"

  # General parameters
  name        = "${local.name}-public-bastion-sg"
  description = "SG with SSH Port open globally"
  vpc_id      = module.vpc.vpc_id

  # Ingress Rules & CIDR Blocks
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags         = local.common_tags
}
