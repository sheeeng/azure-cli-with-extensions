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
          config.allowUnfree = true;
          inherit system;
        };
        lib = pkgs.lib;
        uutils-coreutils = pkgs.uutils-coreutils-noprefix;

        azure-cli-with-extensions = pkgs.azure-cli.override {
          withExtensions = with pkgs.azure-cli.extensions; [
            account # https://search.nixos.org/packages?channel=unstable&type=packages&show=azure-cli-extensions.account # https://github.com/azure/azure-cli-extensions/tree/main/src/account
            aks-preview # https://search.nixos.org/packages?channel=unstable&type=packages&show=azure-cli-extensions.aks-preview # https://github.com/azure/azure-cli-extensions/tree/main/src/aks-preview
            k8s-extension # https://search.nixos.org/packages?channel=unstable&type=packages&show=azure-cli-extensions.k8s-extension # https://github.com/azure/azure-cli-extensions/tree/main/src/k8s-extension
            k8s-runtime # https://search.nixos.org/packages?channel=unstable&type=packages&show=azure-cli-extensions.k8s-runtime # https://github.com/azure/azure-cli-extensions/tree/main/src/k8s-runtime
            log-analytics # https://search.nixos.org/packages?channel=unstable&type=packages&show=azure-cli-extensions.log-analytics # https://github.com/azure/azure-cli-extensions/tree/main/src/log-analytics
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

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # keep-sorted start
            (lib.hiPrio uutils-coreutils-noprefix) # https://search.nixos.org/packages?channel=unstable&type=packages&show=uutils-coreutils-noprefix
            azure-cli-with-configuration-and-extensions # Azure CLI with custom configuration and predefined extensions.
            fluxcd # https://search.nixos.org/packages?channel=unstable&type=packages&show=fluxcd
            gmp # https://search.nixos.org/packages?channel=unstable&type=packages&show=gmp
            go # https://search.nixos.org/packages?channel=unstable&type=packages&show=go
            keep-sorted # https://search.nixos.org/packages?channel=unstable&type=packages&show=keep-sorted
            kubectl # https://search.nixos.org/packages?channel=unstable&type=packages&show=kubectl
            kubectx # https://search.nixos.org/packages?channel=unstable&type=packages&show=kubectx
            kubelogin # https://search.nixos.org/packages?channel=unstable&type=packages&show=kubelogin
            kubernetes-helm # https://search.nixos.org/packages?channel=unstable&type=packages&show=kubernetes-helm
            kustomize # https://search.nixos.org/packages?channel=unstable&type=packages&show=kustomize
            pre-commit # https://search.nixos.org/packages?channel=unstable&type=packages&show=pre-commit
            shellcheck # https://search.nixos.org/packages?channel=unstable&type=packages&show=shellcheck
            shfmt # https://search.nixos.org/packages?channel=unstable&type=packages&show=shfmt
            terraform # https://search.nixos.org/packages?channel=unstable&type=packages&show=terraform
            tflint # https://search.nixos.org/packages?channel=unstable&type=packages&show=tflint
            tfsort # https://search.nixos.org/packages?channel=unstable&type=packages&show=tfsort
            yamlfmt # https://search.nixos.org/packages?channel=unstable&type=packages&show=yamlfmt
            yamllint # https://search.nixos.org/packages?channel=unstable&type=packages&show=yamllint
            # keep-sorted end
          ];

          shellHook = ''
            # Prioritize uutils-coreutils by prepending to $PATH environment variable.
            export PATH="${uutils-coreutils}/bin:$PATH"

            echo ""
            echo "🚀 Pre-commit environment loaded!"
            echo ""

            # Set up environment variables for CI if we're in GitHub Actions.
            if [ -n "$GITHUB_ACTIONS" ]; then
              echo "🔧 GitHub Actions detected. Setting up CI environment."
              export CI=true
              export TF_IN_AUTOMATION=true
              export TF_INPUT=0
            fi
          '';

          PRE_COMMIT_COLOR = "always";
        };
      }
    );
}
