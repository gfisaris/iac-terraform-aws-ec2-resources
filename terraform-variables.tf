##  Project's Information  ##

  variable "project_name" {
    description = "Name of the Project for which the Infrastructure is about | (Example: GEMv2.GLM.app || HTTP || PROD)"
  }


  variable "prj_ecosystem" {
    description = "Name of the Ecosystem, the Web Application is part of | [Valid Values: gemv1 / gemv2]"
  }

  variable "prj_application" {
    description = "Name of the Web Application | (Example: glm-app) | Alphanumeric characters, hyphens (-), and underscores (_) are allowed."
  }

  variable "prj_interface" {
    description = "Which interface will the Web Application be used through | [Valid Values: http / cli]"
  }

  variable "prj_environment" {
    description = "On which Environment will the Web Application be launched | [Valid Values: prod | beta | stg]"
  }

  
##  AWS Account Information  ##

  variable "aws_access_key" {
    decscription = "AWS Access Key"
  }
  
  variable "aws_secret_key" {
    description = "AWS Secret Key"
  }
  
  variable "aws_region" {
    description = "Which AWS Region will be used ?"
    default = "eu-central-1"
  }


#  EC2 | Instances Parameters  ##

  variable "ec2_instance_type" {
    default = "t2.micro"
    description = "The type of the EC2 Instances"
  }


##  EC2 | Network & Security Parameters  ##

  variable "ssh_keypair_public" {
    description = "SSH Public Key that will be used to access the EC2 Instances (Example: ssh-rsa AAABBBCCC999... email@example.com)"
  }


  variable "ec2_instance-root_volume_size" {
    default = 10
    description = "Size (in GB) of the Root Volume for the EC2 Instances"
  }

