variable "environment"       {}
variable "account_shorthand" {}
variable "service" {default = "FoundationalServices"}
variable "mgmt" {default = "Terraform"}

variable "type"     {default = "automation"}
variable "region"   {}
variable "azs"      {type = "map"}
variable "vpc_id"   {}
variable "vpc_cidr" {}
variable "ebs_volume_type" {default = "gp2"}

variable "instance_base_image" { }
variable "public_subnets"  {type = "list"}
variable "private_subnets" {type = "list"}

variable "sg_jenkins_ingress"   {type = "list" default = []}
variable "cidr_jenkins_ingress" {type = "list" default = []}

variable "instance_jenkins_count"         {default = 1}
variable "instance_jenkins_type"          {default = "t2.micro"}
variable "instance_jenkins_ebs_optimized" {default = true}
variable "subtype_jenkins"                {default = "jenkins"}
variable "ebs_volume_jenkins_docker_size" {default = 30}

variable "instance_tools_count"         {default = 1}
variable "instance_tools_type"          {default = "t2.micro"}
variable "instance_tools_ebs_optimized" {default = true}
variable "instance_tools_sgs"           {type = "list" default = []}
variable "subtype_tools"                {default = "tools"}

variable "sg_tools_ingress"   {type = "list" default = []}
variable "cidr_tools_ingress" {type = "list" default = []}
