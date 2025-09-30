# Copilot Commands

## Flake Management

```shell
nix flake check

nix build .#default

nix eval --impure --raw --expr 'builtins.currentSystem'

nix shell nixpkgs#nodejs nixpkgs#nodePackages.npm --command npx renovate-config-validator

nix run nixpkgs#nodePackages.renovate -- --help
```

## Azure CLI Testing

```shell
# Check Azure CLI version (no authentication needed).
nix run . -- --version
```

## Azure Authentication

```shell
# Login to Azure (opens browser for auth).
nix run . -- login

# Check current login status.
nix run . -- account show
```

## Azure CLI Operations

```shell
# List subscriptions.
nix run . -- account list

# List resource groups.
nix run . -- group list
```
