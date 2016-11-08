resource "aws_key_pair" "app" {
  key_name    = "${var.prj_eco}-${var.prj_app}-${var.prj_env}"
  public_key  = "${var.ssh_keypair_public}"
}
