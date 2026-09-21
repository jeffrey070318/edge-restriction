#Requires -RunAsAdministrator
$ErrorActionPreference = 'Stop'

$policy = 'HKLM:\SOFTWARE\Policies\Microsoft\Edge'
$ifeo = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\msedge.exe'
$edge = 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe'
$rule = 'Block Microsoft Edge (User restriction)'

New-Item -Path $policy -Force | Out-Null
$settings = @{
    StartupBoostEnabled = 0
    BackgroundModeEnabled = 0
    DefaultBrowserSettingEnabled = 0
    MetricsReportingEnabled = 0
    PersonalizationReportingEnabled = 0
    UserFeedbackAllowed = 0
    EdgeCollectionsEnabled = 0
    HubsSidebarEnabled = 0
    WebWidgetAllowed = 0
}
foreach ($item in $settings.GetEnumerator()) {
    New-ItemProperty -Path $policy -Name $item.Key -PropertyType DWord -Value $item.Value -Force | Out-Null
}

New-Item -Path $ifeo -Force | Out-Null
New-ItemProperty -Path $ifeo -Name Debugger -PropertyType String -Value 'C:\Windows\System32\cmd.exe /c exit 0' -Force | Out-Null

Get-NetFirewallRule -DisplayName $rule -ErrorAction SilentlyContinue | Remove-NetFirewallRule
if (Test-Path $edge) {
    New-NetFirewallRule -DisplayName $rule -Direction Outbound -Program $edge -Action Block -Profile Any | Out-Null
}

Get-Process msedge -ErrorAction SilentlyContinue | Stop-Process -Force
Write-Host 'Microsoft Edge restrictions applied.'
