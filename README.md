# Microsoft Edge Restriction

PowerShell scripts for limiting Microsoft Edge on Windows without uninstalling Edge or WebView2.

## Apply

Open PowerShell as Administrator and run:

```powershell
.\Apply-EdgeRestrictions.ps1
```

The script disables Edge background features, blocks direct `msedge.exe` launches through IFEO, blocks Edge outbound traffic, and closes running Edge processes.

## Restore

```powershell
.\Restore-EdgeRestrictions.ps1
```

Restart Windows or sign out/in after restoring. These scripts modify machine-wide registry and firewall settings and therefore require Administrator privileges. Windows updates may replace or reset Edge components; rerun the apply script if needed.

## 建议

Chrome 才是版本答案，建议更换；Edge 就是垃圾。
