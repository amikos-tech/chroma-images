# Chroma Images

Motivations:

-  Cleaner images
-  Smaller images
-  Regularly pached
-  SBOMs
-  Signed images
-  Rootless
-  Optimized for production workloads
-  Observability built-in
-  Configurable and efficient logging

The goal of the repo is to create a variety of Chroma container images for testing, experimentation and deployment.

## Images

`chroma:<chroma_version>-bookworm` (`latest` and `latest-bookworm` aliases point to the latest chroma version on bookworm)

`chroma:<chroma_version>-alpine` (`latest-alpine` latest chroma version on alpine)


## Securtity

### GPG Public Key

```
-----BEGIN PUBLIC KEY-----
MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE3fHm6JYq4yXOfm2NXd3Z/Peq2hoA
rRGiviWh/77Do0uW/c03VJwFfTNGchuNQyPx7vETgZ4ier59GLT05DYPSA==
-----END PUBLIC KEY-----
```

Using `cosign`:

```bash
# Set variables
IMAGE="ghcr.io/amikos-tech/chroma-images/chroma:0.6.3-bookworm"
PUBLIC_KEY_URL="https://raw.githubusercontent.com/amikos-tech/chroma-images/main/cosign.pub"

# Download the public key
curl -o cosign.pub $PUBLIC_KEY_URL

# Verify the image
cosign verify --key cosign.pub $IMAGE
```

