resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("C:/Users/HP/Desktop/Terraform/EC2/terraform05/key.pub")
  }