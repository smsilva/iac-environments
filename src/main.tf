resource "random_string" "environment_suffix_id" {
  length      = 6
  special     = false
  upper       = false
  min_numeric = 3
  keepers = {
    name                  = var.environment_name
    region                = var.region
    azure_subscription_id = var.azure_subscription_id
  }
}

locals {
  environment_name = "${var.environment_name}-${random_string.environment_suffix_id.result}"
}

data "template_file" "backend" {
  template = file("${path.module}/templates/instance.tfvars.tpl")

  vars = {
    stack_name            = var.stack_name
    stack_version         = var.stack_version
    azure_subscription_id = var.azure_subscription_id
    environment_name      = local.environment_name
    region                = var.region
    newrelic_account_id   = var.newrelic_account_id
  }
}

resource "local_file" "backend" {
  content         = data.template_file.backend.rendered
  filename        = "${path.module}/../instances/${local.environment_name}.tfvars"
  file_permission = "0644"
}
