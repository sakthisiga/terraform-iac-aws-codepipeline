# Terraform AWS Network Load Balancer (NLB)
module "nlb" {
  source = "terraform-aws-modules/alb/aws"
  # version = "8.6.0"
  version                          = "9.4.0"
  name                             = "${local.name}-mynlb"
  load_balancer_type               = "network"
  vpc_id                           = module.vpc.vpc_id
  subnets                          = module.vpc.public_subnets
  security_groups                  = [module.loadbalancer_sg.security_group_id]
  dns_record_client_routing_policy = "availability_zone_affinity"
  enable_deletion_protection       = false

  listeners = {
    # Listener-1: TCP listener
    my-tcp = {
      port     = 80
      protocol = "TCP"
      forward = {
        target_group_key = "mytg1"
      }
    } # END - my-tcp
    # Listener-2: TLS listener (SSL)
    my-tls = {
      port            = 443
      protocol        = "TLS"
      certificate_arn = module.acm.acm_certificate_arn
      forward = {
        target_group_key = "mytg1"
      }
    } # END my-tls
  }   # END - listeners

  # Target Groups
  target_groups = {
    mytg1 = {
      # VERY IMPORTANT: We will create aws_lb_target_group_attachment resource separately when we use create_attachment = false, refer above GitHub issue URL.
      ## Github ISSUE: https://github.com/terraform-aws-modules/terraform-aws-alb/issues/316
      ## Search for "create_attachment" to jump to that Github issue solution
      create_attachment                 = false
      name_prefix                       = "mytg1-"
      protocol                          = "TCP"
      port                              = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      load_balancing_cross_zone_enabled = false
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
      } # END - Health Check Block
      tags = local.common_tags
    } # END - mytg1
  }   # END - target_groups
  tags = local.common_tags
}

