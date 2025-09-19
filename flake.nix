{
  # Azure CLI with Extensions
  # https://learn.microsoft.com/en-us/cli/azure/azure-cli-extensions-list
  # The list of extensions is also available from the CLI.
  # az extension list-available --output table

  description = "Azure CLI with Extensions";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
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
            account # https://search.nixos.org/packages?channel=unstable&type=packages&show=azure-cli-extensions.account # https://github.com/azure/azure-cli-extensions/tree/main/src/account
            aks-preview # https://search.nixos.org/packages?channel=unstable&type=packages&show=azure-cli-extensions.aks-preview # https://github.com/azure/azure-cli-extensions/tree/main/src/aks-preview
            k8s-extension # https://search.nixos.org/packages?channel=unstable&type=packages&show=azure-cli-extensions.k8s-extension # https://github.com/azure/azure-cli-extensions/tree/main/src/k8s-extension
            k8s-runtime # https://search.nixos.org/packages?channel=unstable&type=packages&show=azure-cli-extensions.k8s-runtime # https://github.com/azure/azure-cli-extensions/tree/main/src/k8s-runtime
          ];
        };

        customConfigurationContent = ''
          [core]
          collect_telemetry = false
          only_show_errors = false
          no_color = true

          [cloud]
          name = AzureCloud

          [extension]
          use_dynamic_install = false
          run_after_dynamic_install = false

          [logging]
          enable_log_file = no
        '';

        azure-cli-with-configuration-and-extensions = pkgs.writeShellScriptBin "az" ''
              set -euo pipefail

              export AZURE_CONFIG_DIR="''${AZURE_CONFIG_DIR:-$HOME/.azure-cli-with-extensions}"

              ${pkgs.coreutils}/bin/mkdir --parents "$AZURE_CONFIG_DIR"

              CONFIGURATION_FILE="$AZURE_CONFIG_DIR/config"

              if [[ ! -f "$CONFIGURATION_FILE" ]]; then
                ${pkgs.coreutils}/bin/cat > "$CONFIGURATION_FILE" << 'EOF'
          ${customConfigurationContent}
          EOF
              fi

              exec ${azure-cli-with-extensions}/bin/az "$@"
        '';
      in
      {
        packages.default = azure-cli-with-configuration-and-extensions;
      }
    );
}
