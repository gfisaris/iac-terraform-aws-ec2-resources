resource "template_file" "ec2_instance_userdata" {
  template  = "${file("template_files/ec2-instance_userdata")}"
  vars {
    activeRegion  = "${var.tf_provider_aws_region}"
    iamAccessKey  = "${var.tf_provider_aws_access_key}"
    iamSecretKey  = "${var.tf_provider_aws_secret_key}"

    efs_ecs_common    = "${data.terraform_remote_state.aws_efs.filesystem_ecs_common_id}"
    ecs_cluster_name  = "${data.terraform_remote_state.aws_ecs.cluster_master_name}"
  }
}
