resource "aws_launch_configuration" "master" {

  name = "${data.terraform_remote_state.project.name}-ecs_cluster_instances"

  image_id      = "${data.terraform_remote_state.aws_ds.ami_amazonlinux_ecs_optimized_id}"
  instance_type = "${var.ec2_instance_type}"

  key_name              = "${aws_key_pair.master.key_name}"

  user_data = "${template_file.ec2_instance_userdata.rendered}"

  enable_monitoring = false

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "10"
    delete_on_termination = true
  }

}
