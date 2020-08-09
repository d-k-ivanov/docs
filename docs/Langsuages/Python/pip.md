### List all packages without version with powershell
```
$packs = $(pip freeze --local); foreach($pack in $packs) { Write-Host $pack.Substring(0, $pack.IndexOf('=')) }
```

### Update all packages with powershell
```
$packs = $(pip freeze --local); foreach($pack in $packs) { pip install -U $pack.Substring(0, $pack.IndexOf('=')) }


### Install
```bash
pip install <package_name>
pip3 install <package_name>
```

### Update
```bash
pip install -U <package_name>
pip3 install -U <package_name>
```


### Update all
```bash
pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U
```
