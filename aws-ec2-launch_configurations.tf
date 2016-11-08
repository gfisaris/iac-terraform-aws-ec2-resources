resource "aws_launch_configuration" "basic" {
  
  name = "${var.prj_eco}-${var.prj_app}-${var.prj_env}"
  
  image_id      = "${data.aws_ami.centos7.id}"
  instance_type = "${var.ec2_instance_type}"
  
  key_name              = "${aws_key_pair.app.key_name}"
  
  user_data = "${template_file.ec2-instance_userdata.rendered}"
  
  enable_monitoring = false
  
  root_block_device {
    volume_type           = "gp2"
    volume_size           = "10"
    delete_on_termination = true
  }
  
}
