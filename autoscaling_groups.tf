resource "aws_autoscaling_group" "ecs_cluster_instances_public_subnets" {
  name = "${data.terraform_remote_state.project.name}-ecs_cluster_instances-public_subnets"

  // load_balancers = [""]
  target_group_arns     = ["${data.terraform_remote_state.aws_ec2_alb.target_group_external_http_80_arn}"]
  vpc_zone_identifier   = ["${data.terraform_remote_state.aws_vpc.subnet_public_id}"]
  launch_configuration  = "${aws_launch_configuration.ecs_cluster_instances_public_subnets.name}"

  health_check_type         = "EC2"
  health_check_grace_period = "300"

  min_size = 1
  max_size = 9
  desired_capacity = 3

  // force_delete = false
  termination_policies  = ["OldestInstance"]
  protect_from_scale_in = true

  enabled_metrics     = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  metrics_granularity = "1Minute"

  tag {
    key                 = "Name"
    value               = "myASG_Instances"
    propagate_at_launch = true
  }

}

output "asg_ecs_cluster_instances_public_subnets_id"    {value = "${aws_autoscaling_group.ecs_cluster_instances_public_subnets.id}"}
output "asg_ecs_cluster_instances_public_subnets_arn"   {value = "${aws_autoscaling_group.ecs_cluster_instances_public_subnets.arn}"}
output "asg_ecs_cluster_instances_public_subnets_name"  {value = "${aws_autoscaling_group.ecs_cluster_instances_public_subnets.name}"}

output "asg_ecs_cluster_instances_public_subnets_min_size"          {value = "${aws_autoscaling_group.ecs_cluster_instances_public_subnets.min_size}"}
output "asg_ecs_cluster_instances_public_subnets_max_size"          {value = "${aws_autoscaling_group.ecs_cluster_instances_public_subnets.max_size}"}
output "asg_ecs_cluster_instances_public_subnets_desired_capacity"  {value = "${aws_autoscaling_group.ecs_cluster_instances_public_subnets.desired_capacity}"}
output "asg_ecs_cluster_instances_public_subnets_default_cooldown"  {value = "${aws_autoscaling_group.ecs_cluster_instances_public_subnets.default_cooldown}"}

output "asg_ecs_cluster_instances_public_subnets_health_check_type"         {value = "${aws_autoscaling_group.ecs_cluster_instances_public_subnets.health_check_type}"}
output "asg_ecs_cluster_instances_public_subnets_health_check_grace_period" {value = "${aws_autoscaling_group.ecs_cluster_instances_public_subnets.health_check_grace_period}"}

output "asg_ecs_cluster_instances_public_subnets_load_balancers"        {value = "${aws_autoscaling_group.ecs_cluster_instances_public_subnets.load_balancers}"}
output "asg_ecs_cluster_instances_public_subnets_target_group_arns"     {value = "${aws_autoscaling_group.ecs_cluster_instances_public_subnets.target_group_arns}"
}
output "asg_ecs_cluster_instances_public_subnets_launch_configuration"  {value = "${aws_autoscaling_group.ecs_cluster_instances_public_subnets.launch_configuration}"}

output "asg_ecs_cluster_instances_public_subnets_availability_zones"  {value = "${aws_autoscaling_group.ecs_cluster_instances_public_subnets.availability_zones}"}
output "asg_ecs_cluster_instances_public_subnets_vpc_zone_identifier" {value = "${aws_autoscaling_group.ecs_cluster_instances_public_subnets.vpc_zone_identifier}"}
