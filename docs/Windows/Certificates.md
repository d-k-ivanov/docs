## Certificates

### How to Retrieve and Export a Non-marked Certificate

* Open the non-exportable certificate in the certificate store to get the thumbprint of the certificate, also known as its unique value.
* Open Regedit to one of the Registry Key Paths below depending on where the certificate is stored and locate the registry key with the matching thumbprint value.
* Once you have exported the registry key, copy the export to the server you need to install the certificate on and import it into the registry. The certificate will appear in the certificate manager with the private key included.

```ps1
# Locations:
Machine Store: HKLM\SOFTWARE\Microsoft\SystemCertificates\MY\Certificates
User Store:    HKCU\SOFTWARE\Microsoft\SystemCertificates\MY\Certificates
```
