# Connect to Azure AD
Connect-AzureAD
Connect-MgGraph -Scopes "RoleManagement.ReadWrite.Directory, Directory.ReadWrite.All"

# Define variables
$PimGroupName = "PIM-Admin-Group"
$EligibleUsers = @("user1@domain.com", "user2@domain.com")
$RoleName = "Owner"
$SubscriptionId = "f7d23680-a82f-42ea-96ee-4169606d7b1e"

# Get the Group Object ID
$Group = Get-AzureADGroup -Filter "DisplayName eq '$PimGroupName'"
if (!$Group) { Write-Host "Group not found!" -ForegroundColor Red; exit }

# Assign users to PIM role
foreach ($UserEmail in $EligibleUsers) {
    $User = Get-AzureADUser -Filter "UserPrincipalName eq '$UserEmail'"
    if ($User) {
        New-MgRoleManagementDirectoryRoleEligibilityScheduleRequest `
            -Action "AdminAssign" `
            -RoleDefinitionId (Get-MgRoleDefinition -Filter "displayName eq '$RoleName'").Id `
            -PrincipalId $User.Id `
            -DirectoryScopeId "/subscriptions/$SubscriptionId" `
            -Justification "Eligible for PIM"
        Write-Host "PIM Role Assigned to $UserEmail" -ForegroundColor Green
    } else {
        Write-Host "User $UserEmail not found!" -ForegroundColor Yellow
    }
}

Write-Host "PIM Group Setup Completed!" -ForegroundColor Cyan
