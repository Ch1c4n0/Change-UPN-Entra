# Instale o módulo caso ainda não o tenha / Install the module if you don't have it yet
# Install-Module Microsoft.Graph -Scope CurrentUser

# 1. Conectar ao Microsoft 365 com as permissões necessárias
# 1. Connect to Microsoft 365 with the required permissions
Connect-MgGraph -Scopes "User.ReadWrite.All"

# 2. Definir os domínios antigo e novo
# 2. Define the old and new domains
$OldDomain = "M365x89593156.OnMicrosoft.com"
$NewDomain = "leadersschool365.cloud"

# [PT-BR] Busca todos os usuários e filtra localmente pelo domínio antigo
# [EN] Gets all users and filters locally by the old domain
$Users = Get-MgUser -All -Property "Id", "UserPrincipalName" | Where-Object { $_.UserPrincipalName -like "*@$OldDomain" }

Write-Host "Usuários encontrados / Users found: $($Users.Count)" -ForegroundColor Cyan

# 4. Loop para atualizar cada usuário
# 4. Loop to update each user
foreach ($User in $Users) {
    # Isolar a parte local (antes do @) / Isolate the local part (before the @)
    $LocalPart = $User.UserPrincipalName.Split("@")[0]
    
    # Construir a nova UPN / Build the new UPN
    $NewUPN = "$LocalPart@$NewDomain"
    
    Write-Host "Alterando / Changing: $($User.UserPrincipalName) -> $NewUPN" -ForegroundColor Yellow
    
    try {
        # Atualizar a UPN no Microsoft 365 / Update the UPN in Microsoft 365
        Update-MgUser -UserId $User.Id -UserPrincipalName $NewUPN
        Write-Host "Sucesso / Success!" -ForegroundColor Green
    }
    catch {
        Write-Host "Erro ao atualizar / Error updating $($User.UserPrincipalName): $_" -ForegroundColor Red
    }
}

# 5. Desconectar / Disconnect
Disconnect-MgGraph
