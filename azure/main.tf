provider "azurerm" {
  version = "~>2.0"
  features {}

  # subscription_id="f186cf07-fab9-4304-a7b0-927fbdb671dc"
  # clien
}

resource "azurerm_resource_group" "terraForm" {
  name     = "terraForm"
  location = "brazilsouth"

  tags = {
    environment = "Terraform Demo"
  }
}

resource "azurerm_virtual_network" "terraform" {
  name                = "terraform-network"
  address_space       = ["10.0.0.0/16"]
  location            = "brazilsouth"
  resource_group_name = "terraform"
}

resource "azurerm_subnet" "terraform" {
  name                 = "interna"
  resource_group_name  = "terraform"
  virtual_network_name = "terraform-network"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_network_interface" "terraform" {
  name                = "terraform-nic"
  location            = "brazilsouth"
  resource_group_name = "terraform"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/f186cf07-fab9-4304-a7b0-927fbdb671dc/resourceGroups/terraform/providers/Microsoft.Network/virtualNetworks/terraform-network/subnets/interna"
    private_ip_address_allocation = "Dynamic"
  }
}

# resource "azurerm_virtual_machine" "dev" {
#   count               = 3
#   name                = "dev${count.index}"
#   resource_group_name = "${azurerm_resource_group.terraForm}.terraForm"
#   location            = "brazilsouth"


#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "16.04.0-LTS"
#     version   = "latest"
#   }
# }
