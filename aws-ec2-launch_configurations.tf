resource "aws_launch_configuration" "ecs_cluster" {

  name = "ecs_cluster"

  image_id      = "${data.terraform_remote_state.aws_dcs.ami_amazonlinux_ecs_optimized_id}"
  instance_type = "${var.ec2_instance_type}"

  key_name              = "${aws_key_pair.ecs_cluster.key_name}"

  user_data = "${template_file.ec2_instance_userdata.rendered}"

  enable_monitoring = false

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "10"
    delete_on_termination = true
  }

}
