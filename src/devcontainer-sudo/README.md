
# Devcontainer-sudo

Install sudo and allow users to run commands

## Example Usage

```json
"features": {
    "ghcr.io/mohrjonas/devcontainer-sudo:1": {
        "user": "ALL"
    }
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| user | The user or group to allow passwordless sudo to | string | ALL |