resource "aws_key_pair" "app" {
  key_name    = "ec2-kp-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
  public_key  = "${var.ssh_keypair_public}"
}
