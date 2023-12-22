  source "amazon-ebs" "shopping-prod" {
 
    ami_name   = local.image_name
    source_ami = var.ami_id
    instance_type = "t2.micro"
    ssh_username  = "ec2-user"
    tags       = {
                  Name    = local.image_name
                  project = var.project_name
                  env     = var.project_env
                  }
  }
  
  build {
    sources =  [ "local.amazon-ebs.shopping-prod" ]

    provisioner "file" {
      source = "../website"
      destination = "/tmp/"
      }
    provisioner "shell" {
      script = "./startup.sh"
      execute_command = "sudo {{.Path}}"
      }
  }
