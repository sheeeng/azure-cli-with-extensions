# Copilot Commands

## Flake Management

```shell
nix flake check

nix build .#default
```

## Azure CLI Testing

```shell
# Check Azure CLI version (no authentication needed).
nix run . -- --version

# Test kubelogin as separate package.
nix run .#kubelogin -- --version

# Test both tools together.
nix shell . .#kubelogin -c bash -c 'which az && which kubelogin'
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

# Get AKS credentials (works with kubelogin integration).
nix run . -- aks get-credentials --resource-group <rg> --name <cluster>
```

## AKS Authentication Workflow

```shell
# Get AKS credentials and configure Azure AD auth.
nix shell . .#kubelogin -c bash -c '
  az aks get-credentials --resource-group <rg> --name <cluster>
  kubelogin convert-kubeconfig -l azurecli
  kubectl get nodes
'
```

## Standalone

```shell
nix-shell --packages azure-cli kubelogin --run "az login"
nix-shell --packages kubectl --run "kubectl get priorityclass"
nix-shell --packages kubectl --run "kubectl get pods --all-namespaces --watch --output wide"
```
