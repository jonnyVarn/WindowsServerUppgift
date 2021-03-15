# start with Invoke-WebRequest -Uri "https://github.com/jonnyVarn/WindowsServerUppgift/blob/main/Install.ps1" -OutFile "C:\Users\superjonny

#first we need to install some stuff
Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools“


#this is for joining a domain with existing forest superjonny

Import-Module ADDSDeployment
-Install-ADDSDomainController `
-NoGlobalCatalog:$false `
-CreateDNSDelegation:$false `
-Credential (Get-Credential) `
-CriticalReplicationOnly:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainName "superjonny.local" `
-InstallDns:$true `
-LogPatch "C:\Windows\NTDS" `
-NoRebootOnCompletion:$False `
-SiteName "Default-First-Site-Name" `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true

ADDSForestInstallation -DomainName superjonny.local -InstallDns



#It it recomended to do a test first ..
#Test-ADDSForestInstallation -DomainName superjonny.local -InstallDns
ADDSForestInstallation -DomainName superjonny.local -InstallDns
