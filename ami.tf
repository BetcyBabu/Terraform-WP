data "aws_ami" "latest" {
    most_recent      = true
    owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "latest-ami-id"{

    value = data.aws_ami.latest.id
}

