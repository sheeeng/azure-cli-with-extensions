{
  # Available Azure CLI Extensions
  # https://learn.microsoft.com/en-us/cli/azure/azure-cli-extensions-list
  # The list of extensions is also available from the CLI.
  # az extension list-available --output table

  description = "Azure CLI with Extensions";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          config.allowUnfree = false;
          inherit system;
        };

        azure-cli-with-extensions = pkgs.azure-cli.override {
          withExtensions = with pkgs.azure-cli.extensions; [
            account # https://github.com/Azure/azure-cli-extensions/tree/main/src/account
            aks-preview # https://github.com/Azure/azure-cli-extensions/tree/main/src/aks-preview
            k8s-extension # https://github.com/Azure/azure-cli-extensions/tree/main/src/k8s-extension
          ];
        };
      in
      {
        packages.default = azure-cli-with-extensions;
      }
    );
}
