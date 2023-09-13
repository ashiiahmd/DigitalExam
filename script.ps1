param (
    [string]$ResourceGroupName,
    [string]$SqlServerName,
    [string]$DatabaseName,
    [int]$NewDTU
)

# Authenticate to Azure
Connect-AzAccount

# Set the target subscription (if not the default)
Set-AzContext -SubscriptionName 'YourSubscriptionName'

# Get the SQL Database
$database = Get-AzSqlDatabase -ResourceGroupName $ResourceGroupName -ServerName $SqlServerName -DatabaseName $DatabaseName

if ($database -ne $null) {
    # Define the new performance level
    $newPerformanceLevel = @{
        RequestedServiceObjectiveName = "ElasticPool"  # Change to "Basic", "Standard", "Premium", or specific DTU SKU
        RequestedServiceObjectiveId   = $null          # Use this instead of "RequestedServiceObjectiveName" if specifying DTU directly
        Edition                      = "Standard"      # Change to the desired edition
        Dtu                          = $NewDTU        # New DTU value
    }

    # Update the database's service objective
    Set-AzSqlDatabase -ResourceGroupName $ResourceGroupName -ServerName $SqlServerName -DatabaseName $DatabaseName -RequestedServiceObjectiveName $newPerformanceLevel.RequestedServiceObjectiveName -Edition $newPerformanceLevel.Edition -Dtu $newPerformanceLevel.Dtu

    Write-Host "DTU for database '$DatabaseName' has been updated to $NewDTU."
} else {
    Write-Host "Database '$DatabaseName' not found in resource group '$ResourceGroupName' and server '$SqlServerName'."
}

# Disconnect from Azure
Disconnect-AzAccount
