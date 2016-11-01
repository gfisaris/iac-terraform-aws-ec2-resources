resource "template_file" "ec2-instance_userdata" {
  template  = "${file("tfile-ec2-instance_userdata")}"
  vars {
    iamAccessKey  = "${var.aws_access_key}"
    iamSecretKey  = "${var.aws_secret_key}"
    activeRegion  = "${var.aws_region}"
  }
}
