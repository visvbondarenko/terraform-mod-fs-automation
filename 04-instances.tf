# EC2 Instance(s)
resource "aws_instance" "jenkins" {
  count                   = "${var.instance_jenkins_count}"
  ami                     = "${var.instance_base_image}"
  instance_type           = "${var.instance_jenkins_type}"
  availability_zone       = "${element(split(",", lookup(var.azs, var.region)), count.index)}"
  subnet_id               = "${element(${var.public_subnets}, 0)}"
  vpc_security_group_ids  = ["${aws_security_group.jenkins.id}", "${aws_security_group.tools.id}"]
  disable_api_termination = true

//  lifecycle {
//    ignore_changes = ["ami"]
//  }
//
//  tags {
//    Account_shorthand = "${var.account_shorthand}"
//    Name        = "${var.account_shorthand}_${var.environment}_${var.type}_${var.subtype_jenkins}${format("%02d", count.index + 1)}"
//    Environment = "${var.environment}"
//    Type        = "${var.type}"
//    Subtype     = "${var.subtype_jenkins}"
//    Identifier  = "${var.account_shorthand}_${var.environment}_${var.type}_${var.subtype_jenkins}"
//    ManagedBy   = "${var.mgmt}"
//    Service     = "${var.service}"
//    Owner       = ""
//    Project     = ""
//  }
}

resource "aws_instance" "tools" {
  count                   = "${var.instance_tools_count}"
  ami                     = "${var.instance_base_image}"
  instance_type           = "${var.instance_tools_type}"
  availability_zone       = "${element(split(",", lookup(var.azs, var.region)), count.index)}"
  subnet_id               = "${element(${var.private_subnets}, 0)}"
  vpc_security_group_ids  = ["${aws_security_group.jenkins.id}", "${aws_security_group.tools.id}"]
  disable_api_termination = true

//  lifecycle {
//    ignore_changes = ["ami"]
//  }
//
//  tags {
//    Account_shorthand = "${var.account_shorthand}"
//    Name        = "${var.account_shorthand}_${var.environment}_${var.type}_${var.subtype_tools}${format("%02d", count.index + 1)}"
//    Environment = "${var.environment}"
//    Type        = "${var.type}"
//    Subtype     = "${var.subtype_tools}"
//    Identifier  = "${var.account_shorthand}_${var.environment}_${var.type}_${var.subtype_tools}"
//    ManagedBy   = "${var.mgmt}"
//    Service     = "${var.service}"
//    Owner       = ""
//    Project     = ""
//  }
}
