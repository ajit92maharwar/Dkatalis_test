module "elasticsearch" {
  source                  = "git::https://github.com/cloudposse/terraform-aws-elasticsearch.git?ref=tags/0.3.5"
  namespace               = "eg"
  stage                   = "dev"
  name                    = "es"
  security_groups         = ["sg-0944068224c4015e4"]
  vpc_id                  = ["vpc-855f50ed"]
  subnet_ids              = ["subnet-b19faad9"]
  zone_awareness_enabled  = "false"
  elasticsearch_version   = "6.5"
  instance_type           = "t2.small.elasticsearch"
  instance_count          = 4
  iam_role_arns           = ["arn:aws:iam::186009306742:user/DemoUser"]
  iam_actions             = ["es:ESHttpGet", "es:ESHttpPut", "es:ESHttpPost"]
  encrypt_at_rest_enabled = true
  kibana_subdomain_name   = "kibana-es"

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }
}
