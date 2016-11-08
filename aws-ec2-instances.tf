resource "aws_instance" "ec2_instance_public" {
  
  ami = "${data.aws_ami.amazonlinux-ecs_optimized.id}"
  instance_type = "t2.micro"

  user_data = "${template_file.ec2-instance_userdata.rendered}"

  subnet_id = "${data.terraform_remote_state.aws_vpc.vpc_subnets_public[0]}"

  iam_instance_profile = "${data.terraform_remote_state.aws_iam.IamRole_ecsContainerInstanceProfile}"
  key_name = "${aws_key_pair.app.key_name}"

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
  
  ami = "${data.aws_ami.amazonlinux-ecs_optimized.id}"
  instance_type = "t2.micro"

  user_data = "${template_file.ec2-instance_userdata.rendered}"

  subnet_id = "${data.terraform_remote_state.aws_vpc.vpc_subnets_private[0]}"

  iam_instance_profile = "${data.terraform_remote_state.aws_iam.IamRole_ecsContainerInstanceProfile}"
  key_name = "${aws_key_pair.app.key_name}"

  root_block_device {
    volume_type		= "gp2"
    volume_size		= "${var.ec2_instance-root_volume_size}"
    delete_on_termination	= true
  }

  tags {
    Name = "ECS Instance - over a Private Subnet"
  }
}


