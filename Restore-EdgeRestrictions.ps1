#Requires -RunAsAdministrator
$ErrorActionPreference = 'Stop'
$ifeo = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\msedge.exe'
$policy = 'HKLM:\SOFTWARE\Policies\Microsoft\Edge'
Remove-ItemProperty -Path $ifeo -Name Debugger -Force -ErrorAction SilentlyContinue
Remove-Item -Path $policy -Recurse -Force -ErrorAction SilentlyContinue
Get-NetFirewallRule -DisplayName 'Block Microsoft Edge (User restriction)' -ErrorAction SilentlyContinue | Remove-NetFirewallRule
Write-Host 'Microsoft Edge restrictions removed. Restart Windows or sign out/in.'
