# AWS

## Convert instances without ENA support modern type

```bash
aws ec2 modify-instance-attribute --instance-id <instance_id> --ena-support
```
