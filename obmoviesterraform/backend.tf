terraform {
  backend "s3"{
      bucket = "bodeabbey-terraform-state"
      key = "bodeabbey-terraform-state/k8"
      region = "eu-west-1"
      profile = "default"
  }
}