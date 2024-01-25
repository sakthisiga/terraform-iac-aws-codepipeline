# Autoscaling Group Resource

resource "aws_autoscaling_group" "myasg" {
    name_prefix = "${local.name}-myasg-"
    desired_capacity = 5
    max_size = 10
    min_size = 5
    vpc_zone_identifier = module.vpc.private_subnets
    target_group_arns = [ module.nlb.target_groups["mytg1"].arn ]
    health_check_type = "EC2"
    # health_check_grace_period = 300 # Default is 300 only

    launch_template {
      id = aws_launch_template.myasg-launch-template.id
      version = aws_launch_template.myasg-launch-template.latest_version
    }

    instance_refresh {
      strategy = "Rolling"
      preferences {
        # instance_warmup = 300 $ Default behaviour to use ASG health check
        min_healthy_percentage = 50
      }
      triggers = [ "desired_capacity" ]
    }

    tag {
        key                 = "Owners"
        value               = "CRM-Team"
        propagate_at_launch = true
    }
}