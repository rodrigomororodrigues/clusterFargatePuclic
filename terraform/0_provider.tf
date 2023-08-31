terraform {
  cloud {
    organization = "rodrigomoro"

    workspaces {
      name = "FarGate-Challenge"
  
    }
  }
}

# Local Test
#provider "aws" {
  # shared_credentials_file = "$HOME/.aws/credentials"
  #access_key = var.access_key
  #secret_key = var.secret_key
  #region = var.region
#}

provider "aws" {
  alias = "hashicorp_aws"
    region = "us-east-2"
}

# random string for flask secret-key env variable
resource "random_string" "morofargate-secret-key" {
  length = 16
  special = true
  override_special = "/@\" "
}