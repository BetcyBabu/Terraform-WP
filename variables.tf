variable "region" {

    default = "ap-south-1"
}

variable "project" {

    default = "uber"
}

variable "cidr_block" {

    default = "172.16.0.0/16"
}

variable "type" {

    default = "t2.micro"
}


variable "database_name" {
  default = "wp_db"
}
variable "database_password" {

    default = "root123"

}
variable "database_user" {

    default = "root"

}
