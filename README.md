# azure-cli-with-extensions

This Azure Command-Line Interface (CLI) with Extensions Nix's Flake shows how you can override a Nix package to add extensions. In this case, we are installing the [azure-cli](https://learn.microsoft.com/en-us/cli/azure/) package with extra [extensions](https://learn.microsoft.com/en-us/cli/azure/azure-cli-extensions-overview).

## Getting started

```shell
flox init
flox install github:sheeeng/azure-cli-with-extensions-flake
flox activate
az extension list
```
