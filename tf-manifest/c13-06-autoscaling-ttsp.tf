# Autoscaling Target Tracking Scaling Policies 
# Define Autoscaling policies and Assocaite them to Autoscaling Group
# TTS - Scaling Policy-1: CPU Utilization of EC2s
resource "aws_autoscaling_policy" "myasg_avg_cpu_policy_greater_than_xx" {
  name                   = "${local.name}-avg_cpu_policy_greater_than_xx"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.myasg.id
  estimated_instance_warmup = 180
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0
  }
}