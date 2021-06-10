## Generate

```sh
certbot certonly -d <domain> -d *.<domain> --dns-route53 --logs-dir ./letsencrypt/log/ --config-dir ./letsencrypt/config/ --work-dir ./letsencrypt/work/ -m <email> --agree-tos --non-interactive --server https://acme-v02.api.letsencrypt.org/directory
```

## Renew

```sh
certbot renew --dns-route53 --logs-dir ./letsencrypt/log/ --config-dir ./letsencrypt/config/ --work-dir ./letsencrypt/work/ --non-interactive --server https://acme-v02.api.letsencrypt.org/directory
```
