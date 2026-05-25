provider "aws" {
  region = var.aws_region
  profile = "terraform"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_iam_user" "terraform" {
  name = "terraform-user"
}

resource "aws_iam_user_policy_attachment" "terraform_policy" {
  user       = aws_iam_user.terraform.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_access_key" "terraform" {
  user = aws_iam_user.terraform.name
}