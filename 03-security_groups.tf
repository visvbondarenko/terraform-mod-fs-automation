# Security groups
resource "aws_security_group" "jenkins" {
  name        = "${var.account_shorthand}_${var.environment}_${var.type}_${var.subtype_jenkins}"
  description = "Allow access to ${var.account_shorthand}_${var.environment}_${var.type}_$ instance(s)"
  vpc_id      = "${var.vpc_id}"

  lifecycle {
    ignore_changes = [
      "description",
      "ami"]
  }

  tags {
    Account_shorthand = "${var.account_shorthand}"
    Environment = "${var.environment}"
    Name        = "${var.account_shorthand}_${var.environment}_${var.type}_${var.subtype_jenkins}"
    Type        = "${var.type}"
    Subtype     = "${var.subtype_jenkins}"
    Identifier  = "${var.account_shorthand}_${var.environment}_${var.type}_${var.subtype_jenkins}"
    ManagedBy   = "${var.mgmt}"
    Service     = "${var.service}"
    Owner       = ""
    Project     = ""
  }
}

resource "aws_security_group_rule" "jenkins_web_http" {
  security_group_id = "${aws_security_group.jenkins.id}"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "jenkins_web_https" {
  security_group_id = "${aws_security_group.jenkins.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "jenkins_web_http_8080" {
  security_group_id = "${aws_security_group.jenkins.id}"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "jenkins_ssh" {
  security_group_id = "${aws_security_group.jenkins.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "jenkins_egress" {
  security_group_id = "${aws_security_group.jenkins.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group" "tools" {
  name        = "${var.account_shorthand}_${var.environment}_${var.type}_${var.subtype_tools}"
  description = "Allow access to ${var.account_shorthand}_${var.environment}_${var.type}_${var.subtype_tools} instance(s)"
  vpc_id      = "${var.vpc_id}"

  lifecycle {
    ignore_changes = [
      "description",
      "ami"]
  }

  tags {
    Account_shorthand = "${var.account_shorthand}"
    Environment = "${var.environment}"
    Name        = "${var.account_shorthand}_${var.environment}_${var.type}_${var.subtype_tools}"
    Type        = "${var.type}"
    Subtype     = "${var.subtype_jenkins}"
    Identifier  = "${var.account_shorthand}_${var.environment}_${var.type}_${var.subtype_tools}"
    ManagedBy   = "${var.mgmt}"
    Service     = "${var.service}"
    Owner       = ""
    Project     = ""
  }
}

resource "aws_security_group_rule" "tools_ssh" {
  security_group_id = "${aws_security_group.jenkins.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "tools_egress" {
  security_group_id = "${aws_security_group.jenkins.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}
