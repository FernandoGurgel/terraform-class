provider "azurerm"{
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


