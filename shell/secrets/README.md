# Secrets

[Sops](https://github.com/mozilla/sops) is used to ensure secure files are encrypted at rest.

Currently, the file that needs to be encrypted is [secrets.yaml](/data/secrets.yaml). However, this may be extended to
other files in the future.

## How do I work with secrets.yaml using Sops

- Sops uses a key from GCP KMS (defined in [sops.yaml](.sops.yaml)). Therefore, you need to be logged into
  gcloud (`gcloud auth login`) to use Sops.
- `secrets.yaml` is not committed to git. Instead, we store an encrypted version of the file in `secrets.encrypted`.

### Running your services

- `yarn secrets:decrypt` is automatically run before `yarn setup` and `yarn start`.
- You can also manually run `yarn secrets:decrypt` to decrypt `secrets.encrypted` into `secrets.yaml`.

### Updating `secrets.yaml`

- Update the values in `secrets.yaml`
- Run `yarn secrets:encrypt` to encrypt `secrets.yaml` into `secrets.encrypted`.

### Checking for changes

- Run `yarn secrets:check`, this will check that the content of `secrets.yaml` is the same as that
  in `secrets.encrypted`. It does this check via a hash which is stored in `.sops-hash`
