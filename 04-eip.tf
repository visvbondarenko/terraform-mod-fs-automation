resource "aws_eip" "jenkins" {
  count    = "${aws_instance.jenkins.count}"
  instance = "${element(aws_instance.jenkins.*.id, count.index)}"
  vpc      = true
}
