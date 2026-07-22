terraform {
  backend "s3" {
    bucket         = "anna-terraform-state-912096796684"
    key            = "lesson-5/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}