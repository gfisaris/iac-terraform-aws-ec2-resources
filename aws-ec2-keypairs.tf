resource "aws_key_pair" "ecs_cluster" {
  key_name    = "ecs_cluster"
  public_key  = "${var.ssh_keypair_public}"
}
