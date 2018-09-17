output "public_lb_dns" {
  value = "${aws_lb.example.dns_name}"
}
