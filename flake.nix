# SPDX-License-Identifier: Apache-2.0 OR MIT
{
  # Available Azure CLI Extensions.
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

        azure-config = pkgs.writeText "azure-config" ''
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
          enable_log_file=no
        '';

        azure-cli-with-configuration-and-extensions = pkgs.writeShellApplication {
          name = "az";
          runtimeInputs = [ azure-cli-with-extensions ];
          text = ''
            # Use isolated configuration directory for this flake.
            TEMP_BASE_DIR=''${TMPDIR:-/tmp} # Explicitly use $TMPDIR if available, fallback to /tmp directory.
            AZURE_CONFIG_DIR=$(${pkgs.coreutils}/bin/mktemp --directory --tmpdir="$TEMP_BASE_DIR" azure-cli-XXXXXXXX)
            export AZURE_CONFIG_DIR

            trap '${pkgs.coreutils}/bin/rm --force --recursive "$AZURE_CONFIG_DIR"' EXIT

            # Set up our configuration.
            ${pkgs.coreutils}/bin/cp "${azure-config}" "$AZURE_CONFIG_DIR/config"
            ${pkgs.coreutils}/bin/chmod +w "$AZURE_CONFIG_DIR/config"

            # Show debug output when AZURE_CLI_DEBUG_CONFIG environment variable is set.
            if [[ -n "''${AZURE_CLI_DEBUG_CONFIG:-}" ]]; then
              echo "AZURE_CONFIG_DIR: $AZURE_CONFIG_DIR" >&2
              echo "Contents:" >&2
              ${pkgs.coreutils}/bin/cat "$AZURE_CONFIG_DIR/config" >&2
            fi

            exec ${azure-cli-with-extensions}/bin/az "$@"
          '';
        };
      in
      {
        packages.default = azure-cli-with-configuration-and-extensions;
      }
    );
}
