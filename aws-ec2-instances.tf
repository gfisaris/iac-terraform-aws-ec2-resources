resource "aws_instance" "public_subnet" {

  ami = "${data.terraform_remote_state.aws_ds.ami_amazonlinux_ecs_optimized_id}"
  instance_type = "t2.micro"

  user_data = "${template_file.ec2_instance_userdata.rendered}"

  subnet_id = "${data.terraform_remote_state.aws_vpc.subnet_public_id[0]}"

  iam_instance_profile = "${data.terraform_remote_state.aws_iam.instance_profile_ecsInstanceProfile_name}"
  key_name = "${aws_key_pair.master.key_name}"

  vpc_security_group_ids = ["${data.terraform_remote_state.aws_vpc.security_group_ec2_instances_id}"]

  root_block_device {
    volume_type		= "gp2"
    volume_size		= "${var.ec2_instance-root_volume_size}"
    delete_on_termination	= true
  }

  tags {
    Name = "${data.terraform_remote_state.project.name}-public_subnet"
  }
}
