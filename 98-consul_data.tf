# Add data to Consul
//resource "consul_key_prefix" "jenkins" {
//  count       = "${aws_instance.jenkins.count}"
//  path_prefix = "aws/vpc/${var.account_shorthand}/${var.environment}/${var.type}/ec2_instances/${var.subtype_jenkins}${format("%02d", count.index + 1)}/"
//
//  subkeys = {
//    "id"                   = "${element(aws_instance.jenkins.*.id, count.index)}"
//    "availability_zone"    = "${element(aws_instance.jenkins.*.availability_zone, count.index)}"
//    "iam_instance_profile" = "${element(aws_instance.jenkins.*.iam_instance_profile, count.index)}"
//    "instance_type"        = "${element(aws_instance.jenkins.*.instance_type, count.index)}"
//    "key_name"             = "${element(aws_instance.jenkins.*.key_name, count.index)}"
//    "private_ip"           = "${element(aws_instance.jenkins.*.private_ip, count.index)}"
//    "tenancy"              = "${element(aws_instance.jenkins.*.tenancy, count.index)}"
//
//    "ebs/docker/availability_zone"     = "${element(aws_ebs_volume.jenkins_docker.*.availability_zone, count.index)}"
//    "ebs/docker/encrypted"             = "${element(aws_ebs_volume.jenkins_docker.*.encrypted, count.index)}"
//    "ebs/docker/kms_key_id"            = "${element(aws_ebs_volume.jenkins_docker.*.kms_key_id, count.index)}"
//    "ebs/docker/size"                  = "${element(aws_ebs_volume.jenkins_docker.*.size, count.index)}"
//    "ebs/docker/volume_id"             = "${element(aws_ebs_volume.jenkins_docker.*.id, count.index)}"
//    "ebs/docker/volume_type"           = "${element(aws_ebs_volume.jenkins_docker.*.type, count.index)}"
//    "ebs/docker/device_name"           = "${element(aws_volume_attachment.jenkins_docker.*.device_name, count.index)}"
//    "ebs/docker/mount_point"           = "/var/lib/docker/"
//    "ebs/docker/logical_volume_size"   = "+100%FREE"
//    "ebs/docker/logical_volume_fstype" = "ext4"
//  }
//}
