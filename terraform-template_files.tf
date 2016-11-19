resource "template_file" "ec2_instance_userdata" {
  template  = "${file("template_files/ec2-instance_userdata")}"
  vars {
    awsRegion     = "${data.terraform_remote_state.project.aws_region}"
    iamAccessKey  = "${data.terraform_remote_state.project.aws_access_key}"
    iamSecretKey  = "${data.terraform_remote_state.project.aws_secret_key}"

    efs_master_id    = "${data.terraform_remote_state.aws_efs.filesystem_master_id}"
    ecs_cluster_name  = "${data.terraform_remote_state.aws_ecs.cluster_master_name}"


    log_group_ssm_agent_logs                        = "${data.terraform_remote_state.aws_cloudwatch.log_group_ssm_agent_logs_arn}"

    log_group_cloudwatch_agent_logs                 = "${data.terraform_remote_state.aws_cloudwatch.log_group_cloudwatch_agent_logs_arn}"
    log_group_cloudwatch_agent_installation_logs    = "${data.terraform_remote_state.aws_cloudwatch.log_group_cloudwatch_agent_installation_logs_arn}"

    log_group_ecs_service_init_logs                 = "${data.terraform_remote_state.aws_cloudwatch.log_group_ecs_service_init_logs_arn}"
    log_group_ecs_service_agent_logs                = "${data.terraform_remote_state.aws_cloudwatch.log_group_ecs_service_agent_logs_arn}"
    log_group_ecs_service_docker_logs               = "${data.terraform_remote_state.aws_cloudwatch.log_group_ecs_service_docker_logs_arn}"

    log_group_ec2_instance_yum_logs                 = "${data.terraform_remote_state.aws_cloudwatch.log_group_ec2_instance_yum_logs_arn}"
    log_group_ec2_instance_cron_logs                = "${data.terraform_remote_state.aws_cloudwatch.log_group_ec2_instance_cron_logs_arn}"
    log_group_ec2_instance_audit_logs               = "${data.terraform_remote_state.aws_cloudwatch.log_group_ec2_instance_audit_logs_arn}"
    log_group_ec2_instance_dmesg_logs               = "${data.terraform_remote_state.aws_cloudwatch.log_group_ec2_instance_dmesg_logs_arn}"
    log_group_ec2_instance_dracut_logs              = "${data.terraform_remote_state.aws_cloudwatch.log_group_ec2_instance_dracut_logs_arn}"
    log_group_ec2_instance_secure_logs              = "${data.terraform_remote_state.aws_cloudwatch.log_group_ec2_instance_secure_logs_arn}"
    log_group_ec2_instance_messages_logs            = "${data.terraform_remote_state.aws_cloudwatch.log_group_ec2_instance_messages_logs_arn}"
    log_group_ec2_instance_logrotate_logs           = "${data.terraform_remote_state.aws_cloudwatch.log_group_ec2_instance_logrotate_logs_arn}"
    log_group_ec2_instance_mail_logs                = "${data.terraform_remote_state.aws_cloudwatch.log_group_ec2_instance_mail_logs_arn}"
    log_group_ec2_instance_mail_statistics_logs     = "${data.terraform_remote_state.aws_cloudwatch.log_group_ec2_instance_mail_statistics_logs_arn}"
    log_group_ec2_instance_cloud_init_logs          = "${data.terraform_remote_state.aws_cloudwatch.log_group_ec2_instance_cloud_init_logs_arn}"
    log_group_ec2_instance_cloud_init_output_logs   = "${data.terraform_remote_state.aws_cloudwatch.log_group_ec2_instance_cloud_init_output_logs_arn}"

  }
}
