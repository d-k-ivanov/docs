#!/usr/bin/env powershell
# TBD...

python -m pip install virtualenv
python -m virtualenv -p C:\Python36\python.exe .\venv
.\venv\Scripts\Activate.ps1
python -m pip install -r .\requirements.txt
