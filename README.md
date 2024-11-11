# Attestations Lab

## Producing and Signing

- Using @actions/attest toolkit
  - @actions/attest-provenance -> SLSA1.0 Provenance Predicate
  - @actions/attest-sbom -> SPDX or CycloneDX SBOM
  - container metadata/manifest???
- Using sigstore cosign
  - Mainly support containers

## Verification


- Verifying the certificate (GH CLI)
  - Attached vs Detached material
    - Rekor CT-log vs signed timestamp
  - Verifying extension properties
- Verifying subject (GH CLI)
  - In-toto resource descriptor
- Verifying predicate values
  - Tailored to each use-case
    - In-toto layouts + evaluator
    - Rego policies
    - CUE policies

## Generate key pair

```sh
cosign generate-key-pair
```

## Create Ephemeral Container

```sh
IMAGE_NAME=$(uuidgen)
IMAGE=ttl.sh/$IMAGE_NAME:1h
cosign copy alpine $IMAGE
```

## Sign container

```sh
cosign sign --key cosign.key $IMAGE
```

## Verify container

```sh
cosign verify --key cosign.pub $IMAGE
```