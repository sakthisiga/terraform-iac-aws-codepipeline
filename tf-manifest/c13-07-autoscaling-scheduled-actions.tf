# Scheduled Action-1: Increase capacoty during business hours
resource "aws_autoscaling_schedule" "increase_capacity_business_hours" {
  scheduled_action_name  = "${local.name}-increase-capacity-business-hours"
  min_size               = 2
  max_size               = 10
  desired_capacity       = 8
  start_time             = "2030-01-01T14:00:00Z"
  recurrence             = "00 09 * * *"
  autoscaling_group_name = aws_autoscaling_group.myasg.id
}

# Scheduled Action-2: Decrease capacity during non-business hours
resource "aws_autoscaling_schedule" "decrease_capacity_non_business_hours" {
  scheduled_action_name  = "${local.name}-decrease-capacity-non-business-hours"
  min_size               = 2
  max_size               = 10
  desired_capacity       = 2
  start_time             = "2030-01-01T21:00:00Z"
  recurrence             = "00 21 * * *"
  autoscaling_group_name = aws_autoscaling_group.myasg.id
}