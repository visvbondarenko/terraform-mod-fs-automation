# EBS volume(s)
resource "aws_ebs_volume" "jenkins_docker" {
  count             = "${aws_instance.jenkins.count}"
  availability_zone = "${element(split(",", lookup(var.azs, var.region)), count.index)}"

  size = "${var.ebs_volume_jenkins_docker_size}"
  type = "${var.ebs_volume_type}"
  encrypted  = false

  tags {
    Name              = "${var.subtype_jenkins}${format("%02d", count.index + 1)}.${var.type}"
    Account_shorthand = "${var.account_shorthand}"
    Name        = "${var.account_shorthand}_${var.environment}_${var.type}_${var.subtype_tools}${format("%02d", count.index + 1)}"
    Environment = "${var.environment}"
    Type        = "${var.type}"
    Subtype     = "${var.subtype_tools}"
    Identifier  = "${var.account_shorthand}_${var.environment}_${var.type}_${var.subtype_tools}"
    ManagedBy   = "${var.mgmt}"
    Service     = "${var.service}"
    Owner       = ""
    Project     = ""
    Volume      = "docker"
  }
}

resource "aws_volume_attachment" "jenkins_docker" {
  count = "${aws_instance.jenkins.count}"

  device_name = "/dev/xvdb"

  volume_id   = "${element(aws_ebs_volume.jenkins_docker.*.id, count.index)}"
  instance_id = "${element(aws_instance.jenkins.*.id, count.index)}"
}
