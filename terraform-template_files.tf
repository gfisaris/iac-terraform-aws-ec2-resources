resource "template_file" "ec2-instance_userdata" {
  template  = "${file("tfile-ec2-instance_userdata")}"
  vars {
    iamAccessKey  = "${var.aws_access_key}"
    iamSecretKey  = "${var.aws_secret_key}"
    activeRegion  = "${var.aws_region}"
    
    ##EFS_ECS_Common  = "${data.terraform_remote_state.aws_efs.FS-ECS_Common-ID}"

    ecs_cluster_name = "${data.terraform_remote_state.aws_ecs.Cluster_Name}"
  }
}
