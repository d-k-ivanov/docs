### Export PEM

```bash
openssl pkcs12 -in certname.pfx -clcerts -nokeys -out certname.pem [-nodes]
```

### Export private key

```bash
openssl pkcs12 -in certname.pfx -nocerts -out certname.key [-nodes]
```

### Export CAs

```bash
openssl pkcs12 -in  certname.pfx -cacerts -nokeys -out certname.ca
```

### Export chain

```bash
openssl pkcs12 -in certname.pfx -out full_chain.pem [-nodes]
```

### Create PFX container from PEM chain

```bash
 openssl pkcs12 -export -out certname.pfx -in full_chain.pem
```