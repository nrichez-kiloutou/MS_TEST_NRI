locals {
  tags = {
    "kil:product-name" : "MS-TestNRI",
    "kil:product-version" : "1",
    "kil:generator" : "terraform",
    "kil:generator-version" : "1.0.7",
    "kil:git-repository" : "MS_TEST_NRI",
    "kil:environment" : "dev",
    "kil:istransverse" : "no",
    "kil:monitoring" : "false"
  }
}

locals {
  env = {
    default = {
      vpc_name             = "main_vpc"
      product_version      = "v1"
      product_trigram      = "nri"
      region               = "eu-west-1"
      default_tags         = local.tags
    }
    dev = {
      profile      = "dev",
      default_tags = merge(local.tags, { "kil:environment" : "dev" })
    },
    int = {
      profile      = "int",
      default_tags = merge(local.tags, { "kil:environment" : "int" })
    },
    uat = {
      profile      = "uat",
      default_tags = merge(local.tags, { "kil:environment" : "uat" })
    },
    tra = {
      profile      = "tra",
      default_tags = merge(local.tags, { "kil:environment" : "tra" })
    },
    stg = {
      profile      = "stg",
      default_tags = merge(local.tags, { "kil:environment" : "stg" })
    },
    prd = {
      profile      = "prd",
      default_tags = merge(local.tags, { "kil:environment" : "prd" })
    }
  }

  environmentvars = contains(keys(local.env), terraform.workspace) ? terraform.workspace : "default"
  workspace       = merge(local.env["default"], local.env[local.environmentvars])
}
