resource "aws_launch_configuration" "ecs_cluster_instances_public_subnets" {
  name = "${data.terraform_remote_state.project.name}-ecs_cluster_instances-public_subnets"

  image_id      = "${data.terraform_remote_state.aws_ds.ami_amazonlinux_ecs_optimized_id}"
  user_data     = "${template_file.ec2_instance_userdata.rendered}"
  instance_type = "t2.micro"

  key_name = "${aws_key_pair.master.key_name}"
  iam_instance_profile = "${data.terraform_remote_state.aws_iam.instance_profile_ecsInstanceProfile_name}"

  security_groups = ["${data.terraform_remote_state.aws_vpc.security_group_ec2_instances_id}"]
  associate_public_ip_address = "true"

  user_data = "${template_file.ec2_instance_userdata.rendered}"

  ebs_optimized = false
  enable_monitoring = false

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "10"
    delete_on_termination = true
  }

}
