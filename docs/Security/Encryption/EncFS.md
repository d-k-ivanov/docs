### Encryption
```bash
encfs <full_path_to_future_encrypted_folder> <full_path_to_future_unencrypted_folder>
# Choose methods and password (for methods simple choose 'p' to get paranoic options)
```

### Mount
```bash
encfs <full_path_to_future_encrypted_folder> <full_path_to_future_unencrypted_folder>
```

### Unmount
```bash
fusermount -u <full_path_to_future_unencrypted_folder>
```