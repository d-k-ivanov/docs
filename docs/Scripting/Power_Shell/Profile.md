### Automatically add Workdir folder to PSModulePath in Visual Studio Code

```ps1
'$Env:PSModulePath  = "$(Get-Location)" + "$([System.IO.Path]::PathSeparator)${Env:PSModulePath}"' | `
Add-Content $(Join-Path $(Split-Path $profile) Microsoft.VSCode_profile.ps1)
```
