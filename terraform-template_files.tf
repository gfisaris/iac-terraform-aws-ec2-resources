resource "template_file" "ec2_instance_userdata" {
  template  = "${file("template_files/ec2-instance_userdata")}"
  vars {
    awsRegion     = "${data.terraform_remote_state.project.aws_region}"
    iamAccessKey  = "${data.terraform_remote_state.project.aws_access_key}"
    iamSecretKey  = "${data.terraform_remote_state.project.aws_secret_key}"

    efs_master_id    = "${data.terraform_remote_state.aws_efs.filesystem_master_id}"
    ecs_cluster_name  = "${data.terraform_remote_state.aws_ecs.cluster_master_name}"
  }
}
