resource "aws_key_pair" "master" {
  key_name    = "${data.terraform_remote_state.project.name}"
  public_key  = "${var.ssh_keypair_public}"
}
