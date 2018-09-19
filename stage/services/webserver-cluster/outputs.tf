output "public_lb_dns" {
  value = "${module.webserver_cluster.public_lb_dns}"
}
