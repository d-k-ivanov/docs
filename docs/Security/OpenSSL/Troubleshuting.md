# Troubleshutind SSL Connections

## Remove password from SSL certificate

```bash
openssl rsa -<algorithm> -in secured.key -out unsecured.key
```

## Get SSL info about URL

```bash
# SNI
openssl s_client -showcerts -servername www.example.com -connect www.example.com:<port|443>
# Not SNI
openssl s_client -showcerts -connect www.example.com:<port|443>
# Connetc with self-signed certificates
openssl s_client -showcerts -key self-signed.key -cert self-signed.cert -connect www.example.com:<port|443>
```
