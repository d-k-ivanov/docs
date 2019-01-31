# Bitbucket related things

## API

### Get information about repository

```bash
# Get common repo info
curl -G https://api.bitbucket.org/2.0/repositories/atlassian/atlassian-aws-deployment | jq .
# API links
curl -G https://api.bitbucket.org/2.0/repositories/atlassian/atlassian-aws-deployment | jq [.links]
# Get list of branches
curl -G https://api.bitbucket.org/2.0/repositories/atlassian/atlassian-aws-deployment/refs/branches | jq .
```

### Get SSH URLs of each user's or team's repo

* **Curl**

```bash
curl -G -u XXX:XXX "https://api.bitbucket.org/2.0/repositories/{user-or-team}?pagelen=100" | jq '(.values[].links.clone[] | select(.name | contains(\"ssh\"))).href' | sort
```

* **Power Shell**

```ps
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$username = Read-Host 'What is your username?'
$password = Read-Host 'What is your password?' -AsSecureString
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $username,$password)))
# Many repos
(Invoke-RestMethod -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)} -Uri 'https://api.bitbucket.org/2.0/repositories/{user-or-team}?pagelen=100').values.links | %{Write-Host ($_.clone | Where name -eq ssh).href}

# If only one repo there is second method
(Invoke-WebRequest -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)} -Uri 'https://api.bitbucket.org/2.0/repositories/{user-or-team}?pagelen=1' | ConvertFrom-Json).values.links.clone | Where name -eq ssh | Select href
```
