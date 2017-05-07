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