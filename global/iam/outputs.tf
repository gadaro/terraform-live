/* Must specify the index when using count on the original resource, it becomes
an array */
output "neo_arn" {
  value = "${aws_iam_user.example.0.arn}"
}

output "all_arns" {
  value = "${aws_iam_user.example.*.arn}"
}
