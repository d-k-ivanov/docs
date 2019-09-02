### List all packages without version with powershell
```
$packs = $(pip freeze --local); foreach($pack in $packs) { Write-Host $pack.Substring(0, $pack.IndexOf('=')) }
```

### Update all packages with powershell
```
$packs = $(pip freeze --local); foreach($pack in $packs) { pip install -U $pack.Substring(0, $pack.IndexOf('=')) }
```