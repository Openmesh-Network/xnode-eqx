data "aws_route53_zone" "selected" {
  provider = aws.apse2

  name         = "${var.domain_name}."
  private_zone = false
}

resource "aws_route53_record" "first_ip" {
  provider   = aws.apse2
  #depends_on = [module.multiarch-k8s]

  for_each = toset(["query", "stats", "ws"])

  zone_id         = data.aws_route53_zone.selected.id
  name            = "${each.key}.${var.project_id != "" ? var.project_id : random_string.project_id.result}.${var.domain_name}"
  type            = "A"
  ttl             = 300
  records         = [module.multiarch-k8s.first_ip]
  allow_overwrite = true
}
