### View PEM encoded certificate
```bash
openssl x509 -in certname.pem -text -noout
openssl x509 -in certname.cer -text -noout
openssl x509 -in certname.crt -text -noout
```

### View DER encoded Certificate
```bash
openssl x509 -in certname.der -inform der -text -noout
```

### PEM to DER
```bash
openssl x509 -in certname.crt -outform der -out cert.der
```

###DER to PEM
```bash
openssl x509 -in certname.crt -inform der -outform pem -out cert.pem
```

### Extracting Certificate and Private Key Files from a .pfx File
* Extract private key: 
```bash
openssl pkcs12 -in certname.pfx -nocerts -out key.pem -nodes
```
* Extract certificate: 
```bash
openssl pkcs12 -in certname.pfx -nokeys -out certname.pem
```
* Remove passphrase from private key: 
```bash
openssl rsa -in key.pem -out certname.key 
```

