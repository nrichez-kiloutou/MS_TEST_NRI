provider "aws" {
  region  = local.workspace["region"]
  profile = local.workspace["profile"]
  default_tags {
    tags = local.tags
  }
}

module "back" {
  source       = "./modules/back"
  default_tags = merge(local.workspace["default_tags"], { "kil:layer-id" : 3 })

  product_version      = local.workspace["product_version"]
  product_trigram      = local.workspace["product_trigram"]
  # technical_parameters = local.workspace["technical_parameters"]

  # vpce_endpoint_id   = data.aws_vpc_endpoint.api_gateway_vpce.id
  # subnet_group_list  = data.aws_subnet_ids.private_subnets_ids.ids
  # security_group_ids = data.aws_security_groups.security_groups_ids.ids
}
