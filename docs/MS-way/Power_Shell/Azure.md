### Install the Azure Resource Manager modules from the PowerShell Gallery
```ps1
Install-Module AzureRM
```

### To log in to Azure Resource Manager
```ps1
Login-AzureRmAccount
```

### You can also use a specific Tenant if you would like a faster log in experience
```ps1
Login-AzureRmAccount -TenantId xxxx
```

### To view all subscriptions for your account
```ps1
Get-AzureRmSubscription
```

### To select a default subscription for your current session.
```ps1
# This is useful when you have multiple subscriptions.
Get-AzureRmSubscription -SubscriptionName "your sub" | Select-AzureRmSubscription
```

### View your current Azure PowerShell session context
```ps1
# This session state is only applicable to the current session and will not affect other sessions
Get-AzureRmContext
```
### To select the default storage context for your current session
```ps1
Set-AzureRmCurrentStorageAccount -ResourceGroupName "your resource group" -StorageAccountName "your storage account name"
```

### View your current Azure PowerShell session context
```ps1
# Note: the CurrentStorageAccount is now set in your session context
Get-AzureRmContext
```

### To list all of the blobs in all of your containers in all of your accounts
```ps1
Get-AzureRmStorageAccount | Get-AzureStorageContainer | Get-AzureStorageBlob
```
`