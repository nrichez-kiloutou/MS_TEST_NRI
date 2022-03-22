terraform {
  backend "s3" {
    bucket  = "kil-terraform-tfstates-store"
    key     = "testnri1.terraform.tfstate"
    region  = "eu-west-1"
    profile = "sharerun"
  }
}
