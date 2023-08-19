tags = {
  "env" : "sandbox",
  "project" : "komatsu",
}

// Resource group
resource_group_name     = "komatsu-dx-app"
resource_group_location = "japaneast"

// webapp module
// Service plan
service_plan_name     = "komatsu-service-plan"
service_plan_os_type  = "Linux"
service_plan_sku_name = "B1"


// network module
virtual_network_name              = "Vnet"
virtual_network_address_space     = ["10.0.0.0/16"]
protected_subnet_name             = "protected_subnet1"
protected_subnet_address_prefixes = ["10.0.2.0/24"]
protected_subnet_nsg_name         = "protected_subnet_nsg1"
private_subnet_name               = "private_subnet1"
private_subnet_address_prefixes   = ["10.0.1.0/24"]
private_subnet_nsg_name           = "private_subnet_nsg1"

// dns module
private_dns_zone_name     = "komatsu.postgres.database.azure.com"
virtual_network_link_name = "virtual_network_link1"

// db
db_name       = "komatsu1-postgresql-server"
db_version    = "12"
db_storage_mb = 32768
db_sku_name   = "B_Standard_B1ms"
db_zone       = "1"
db_high_availability = {
  mode                      = "ZoneRedundant"
  standby_availability_zone = "2"
}
database_name      = "komatsu-db"
database_collation = "en_US.utf8"
database_charset   = "utf8"

// Web app
web_app_name       = "nestjs6-web-app"
web_app_https_only = true
APP_ENV                             = "development"
APP_PORT                            = "3000"
DB_NAME                             = "komatsu-db"    
DB_PORT                             = "5432"
DB_SSL                              = "true"
JWT_ACCESS_TOKEN_EXP_IN_SEC         = "3600"
JWT_REFRESH_TOKEN_EXP_IN_SEC        = "7200"
WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
DEFAULT_ADMIN_USER_PASSWORD         = "komatsupwd"
// TODO: Create secretes for below variables in Key Vault
# DB_USER                             = "komatsuadmin"
# DB_PASS                             = "mlazuredb1!"
# JWT_PRIVATE_KEY_BASE64              = "LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0KTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUF2ZjJaZ0VTMGlVelRDQjRMOTZLNAppckZ5QnVTbXhwQjAvZllmRmtkY0V5a1VjMnd3OG1rOWxtTFNDOUw1RVphc0VSQWc1eDBueTVJaUEzNWhROHp6Ci82YTQ1UEJNKzRlWmc4TW5JaU15UHhRclVWWGZ3NTdvQVVwalNZZFFVcDN0S0N2eHhKYytLTE1pdVpFZjdKMzIKdzZZR2tVRngwb0R3YldzMFJsanA4ckxyV0pCbnNZd3ZLK1hGUWFmWkNuQSs3ZmZZbmxGdXFOalgvMnQrR2tZSQoxbE9PVVNGN0RjVXc5QzEyVmFCeDRMbVhpUU9tMU00NUFEcThKWDdQUlk5c1JyeDArT0NER0ZpellEOEYyMlplCkREKzFCcTQvY09DakFEQWwrbC93OEFJV0RTQjlxOTJzVUNOMk9BNWVIZWl4bFZtczFUMDNXOFEzekg0SStuc0UKWndJREFRQUIKLS0tLS1FTkQgUFVCTElDIEtFWS0tLS0tCg=="
# JWT_PUBLIC_KEY_BASE64               = "LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFcEFJQkFBS0NBUUVBdmYyWmdFUzBpVXpUQ0I0TDk2SzRpckZ5QnVTbXhwQjAvZllmRmtkY0V5a1VjMnd3CjhtazlsbUxTQzlMNUVaYXNFUkFnNXgwbnk1SWlBMzVoUTh6ei82YTQ1UEJNKzRlWmc4TW5JaU15UHhRclVWWGYKdzU3b0FVcGpTWWRRVXAzdEtDdnh4SmMrS0xNaXVaRWY3SjMydzZZR2tVRngwb0R3YldzMFJsanA4ckxyV0pCbgpzWXd2SytYRlFhZlpDbkErN2ZmWW5sRnVxTmpYLzJ0K0drWUkxbE9PVVNGN0RjVXc5QzEyVmFCeDRMbVhpUU9tCjFNNDVBRHE4Slg3UFJZOXNScngwK09DREdGaXpZRDhGMjJaZUREKzFCcTQvY09DakFEQWwrbC93OEFJV0RTQjkKcTkyc1VDTjJPQTVlSGVpeGxWbXMxVDAzVzhRM3pINEkrbnNFWndJREFRQUJBb0lCQUFSN1dRV25tVUtyNTBhSAp2dXlHa0NmbGE3VXg2NlUvZnlNR2pWRXZPY0xSODBPTng5SFFIYjNRY3ZnSWNBdTBMRGJ5MUhQZlFqTVJMWEE3CnFQdTZkLzhONWNxd3lJQWVnTWFVOGZWaU15czl4SS9Vb01TeW1QSisyTHpCVG1uRWcvV3dvN0ZwaC9QWjFmWGUKc0l3YVpkblRycy82WlQ3Ny82LzFHWFNYWUYxelJLWkVTb3FHeVkrV2lNQm5TRkw2RFNkM3BrUXd5VW9hUFFjNwppNWdYUkUrK1VKZ2o5c0hzVFZudFRzRThRandOc1JieU4xQ0UvUjVHelJJN2ZFcFByVnlzRlMzY214dzRpQnBHCnhpZUkvNXpCNTBLZzR4SDZySXdUcmx1SjFqYWJQMmQxTjBMcWlHeHhnVXFoTnFlR1dkKzZKNXp1c296Ky9INnoKMGlweWkxRUNnWUVBM2FEUW8zbWVaTmYybW9xU2lTd0lDL3RLb1dGeDZlQXcrOEJYbGZ5SXpSdjlVT1YyMkZaaApJSXBxbXpxaWlvdSt2MExISmtUOEFnUE9tZzdQdG1SMEdTVlR6cTM1RFJvcE12NGR5YWg1RUlwZmdzRXhNWjYzCkxyNGFva2lJYXlRckxwWjJYK0VpckxiS2J6RXNiZ0ljT01leExveU52ZVZoYUxlVjI3bFV3U3NDZ1lFQTIzU3kKRGUrREl3VnQ4NVdnOHNQWnhXaHhVUmladWZUSHpCczNOSzJvb2ptOGhJeGNWRDcvZ2FORzRmaGhyUDQ1UDM3NwpqRnpGQnhaRWYvakpMSFBTMmR5ZHFaMFNXbDVKUjU1Q1NCSHpFdTNyZEJadjIxYXMyQ1k2TkFLZDhGeW5ObitBCjdtbGwvc1ptVVlUNk8zNm5lc2NIcG9IdGZYekJSMW05VDZjSTA3VUNnWUJvUzdxRGc4TTNYNjVNVWJQZDI1dTUKejdyeU1RSkRkbDUyeXJBdEJCZDR0cGhDRG9vY0NxSlFodkxlTS95enlFbXVoZ1ZrREFpd0JneWUwU09NaUw5ZAo2Z1FEZWpsK29mWUxhaXlvYnFEeVdMdlRzNGlyK2kzb1VFd0dYSzNlQmJwUWhUd1ZxTVFCbFUrMGZlYVRxbWlQCmkrSGtydjR4QkJZUUNuejZWci84MndLQmdRQ0RjcytnQjBHK1BXZFJpdU4vNWczUDc3SklSL3IwWm9reVdXN2sKejh2OWQ2WFNveHcrbmdsL1JpU1QvNm5KNi9Dd2RzZ0htQjJ3RkFkdHU4QU1MMGd4bExLZlFPVVlXZmQ4dlcrbwpLWkEyVzJvMys2UitkZGxNRXdHejI0bHN5cUtod3hlZ05tT1FpcGdJNWlUWWRCR3ZPZjM4SDBENGREeDFGMnlNCmhGbUdMUUtCZ1FEUVBvVHN2VlF2eFRJUWk4enQ5YU1aNFVPRHo0V0JPaEdIUE1VVGxESWF0OW8xVUhMTnVEdEgKbjF0Nk40OUpvYU4ycmFXQkRZWGpUVG0ycVFwVnludG9QWFlqOUZmaEMvaW9nVlpFSTkyMG50Qk5aQTVQOWh0dwo1dEo5bVZjWkkwT2ExQjFITzIrR2d0U25obkk2UFlHSEFaQUNCMDhQQTAwOGlTOThhYUVhcnc9PQotLS0tLUVORCBSU0EgUFJJVkFURSBLRVktLS0tLQo="

// Container Registry
acr_name = "komatsu"
acr_sku  = "Basic"

// Key vault
# key_vault_name = "komatsukeyvault"
# key_vault_sku = "standard"

// Use the following command to get key vault id
// az keyvault show --name "komatsukeyvault"
// TODO: Replace key_vault_id with the one you create manually
key_vault_id = "/subscriptions/fa40ee3f-0b7d-4f80-84b5-dd59c484dce7/resourceGroups/komatsu-dx-app/providers/Microsoft.KeyVault/vaults/komatsukeyvault"