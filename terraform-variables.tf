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
