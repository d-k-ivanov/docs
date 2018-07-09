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
