# Create an Azure AD security group
resource "azuread_group" "pim_group" {
  display_name     = var.pim_group_name
  security_enabled = true
  owners          = [var.group_owner_email]
}

# Assign RBAC role at subscription level to the PIM group
resource "azurerm_role_assignment" "pim_rbac" {
  scope               = "/subscriptions/${var.subscription_id}"
  role_definition_name = var.role_assignment
  principal_id        = azuread_group.pim_group.object_id
}
