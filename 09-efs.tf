#Elastic file system (EFS)
resource "aws_efs_file_system" "jenkins_efs" {
  tags {
    Account_shorthand = "${var.account_shorthand}"
    Name        = "${var.account_shorthand}_${var.environment}_${var.type}_${var.subtype_jenkins}"
    Environment = "${var.environment}"
    Type        = "${var.type}"
    Subtype     = "${var.subtype_jenkins}"
    Identifier  = "${var.account_shorthand}_${var.environment}_${var.type}_${var.subtype_jenkins}"
    ManagedBy   = "${var.mgmt}"
    Service     = "${var.service}"
    Owner       = ""
    Project     = ""
  }
}

resource "aws_efs_mount_target" "jenkins_efs" {
  security_groups = ["${aws_security_group.jenkins.id}"]
  file_system_id  = "${aws_efs_file_system.jenkins_efs.id}"
  subnet_id       = "${element(${var.public_subnets}, 0)}"
}
