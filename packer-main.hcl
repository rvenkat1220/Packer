# Variables
# variable "aws_access_key" {
#   type = string
# }

# variable "aws_secret_key" {
#   type = string
# }

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

# Sources (Builders)
source "amazon-ebs" "demo" {
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key
  region     = "ap-southeast-1"
  source_ami = "ami-0910e4162f162c238"
  instance_type = "t2.micro"
  ssh_username = "amazonlinux"
  ami_name = "packer-demo-ami-${local.timestamp}"
}

# Builds
build {
  sources = [
    "source.amazon-ebs.demo",
  ]

  # Provisioners
  provisioner "shell" {
    inline = [
      "sleep 30",
      "sudo apt-get update",
      "sudo apt-get upgrade -y",
      "sudo apt-get install -y nginx",
    ]
  }

  # Post-processors
  post-processor "manifest" {
    output = "manifest.json"
    strip_path = true
  }
}
