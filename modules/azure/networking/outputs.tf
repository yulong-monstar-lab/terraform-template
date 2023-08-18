output "virtual_network_id" {
  value = azurerm_virtual_network.virtual_network.id
}


output "private_subnet_id" {
  value = azurerm_subnet.private_subnet.id
}
