resource "aws_instance" "ec2_instance_public" {

  ami = "${data.terraform_remote_state.aws_dcs.ami_amazonlinux_ecs_optimized_id}"
  instance_type = "t2.micro"

  user_data = "${template_file.ec2_instance_userdata.rendered}"

  subnet_id = "${data.terraform_remote_state.aws_vpc.ecs_cluster_vpc_subnet_public_id[0]}"

  iam_instance_profile = "${data.terraform_remote_state.aws_iam.ecs_cluster_iamInstanceProfile_ecsInstanceRole_name}"
  key_name = "${aws_key_pair.ecs_cluster.key_name}"

  vpc_security_group_ids = ["${data.terraform_remote_state.aws_vpc.security_group_ec2_instances_ecs_cluster_id}"]

  root_block_device {
    volume_type		= "gp2"
    volume_size		= "${var.ec2_instance-root_volume_size}"
    delete_on_termination	= true
  }

  tags {
    Name = "ECS Instance - over a Public Subnet"
  }
}

resource "aws_instance" "ec2_instance_private" {

  count = 0

  ami = "${data.terraform_remote_state.aws_dcs.ami_amazonlinux_ecs_optimized_id}"
  instance_type = "t2.micro"

  user_data = "${template_file.ec2_instance_userdata.rendered}"

  subnet_id = "${data.terraform_remote_state.aws_vpc.ecs_cluster_vpc_subnet_private_id[0]}"

  iam_instance_profile = "${data.terraform_remote_state.aws_iam.ecs_cluster_iamInstanceProfile_ecsInstanceRole_name}"
  key_name = "${aws_key_pair.ecs_cluster.key_name}"

  vpc_security_group_ids = ["${data.terraform_remote_state.aws_vpc.security_group_ec2_instances_ecs_cluster_id}"]

  root_block_device {
    volume_type		= "gp2"
    volume_size		= "${var.ec2_instance-root_volume_size}"
    delete_on_termination	= true
  }

  tags {
    Name = "ECS Instance - over a Private Subnet"
  }
}
