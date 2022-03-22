# data "aws_vpc" "main_vpc" {
#   tags = {
#     Name = local.workspace["vpc_name"]
#   }
# }

# data "aws_subnet_ids" "private_subnets_ids" {
#   vpc_id = data.aws_vpc.main_vpc.id

#   filter {
#     name   = "tag:Name"
#     values = ["private*"]
#   }
# }

# data "aws_vpc_endpoint" "api_gateway_vpce" {
#   vpc_id       = data.aws_vpc.main_vpc.id
#   service_name = "com.amazonaws.eu-west-1.execute-api"
# }

# data "aws_security_groups" "security_groups_ids" {
#   tags = {
#     Name = "default_security_group"
#   }
# }

# data "aws_caller_identity" "current" {}
