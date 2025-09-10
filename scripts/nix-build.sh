#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0 OR MIT

# https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
set -o pipefail # If set, the return value of a pipeline is the value of the last (rightmost) command to exit with a non-zero status, or zero if all commands in the pipeline exit successfully. This option is disabled by default.
set -o errexit  # set -e # Exit immediately if a pipeline, which may consist of a single simple command, a list, or a compound command returns a non-zero status.
set -o nounset  # set -u # Treat unset variables and parameters other than the special parameters ‘@’ or ‘*’, or array variables subscripted with ‘@’ or ‘*’, as an error when performing parameter expansion. An error message will be written to the standard error, and a non-interactive shell will exit.
# set -o xtrace  # set -x # Print a trace of simple commands, for commands, case commands, select commands, and arithmetic for commands and their arguments or associated word lists after they are expanded and before they are executed. The value of the PS4 variable is expanded and the resultant value is printed before the command and its expanded arguments.

# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s inherit_errexit # If set, command substitution inherits the value of the errexit option, instead of unsetting it in the subshell environment. This option is enabled when POSIX mode is enabled.

if [ -d ".git" ] || git rev-parse --git-dir > /dev/null 2>&1; then
  GIT_ROOT_DIRECTORY=$(git rev-parse --show-toplevel)
  echo "\${GIT_ROOT_DIRECTORY}: ${GIT_ROOT_DIRECTORY}"
fi
SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)"
echo "\${SCRIPT_DIRECTORY}: ${SCRIPT_DIRECTORY}"

export PYTHONWARNINGS="ignore::FutureWarning" # https://github.com/Azure/azure-cli/pull/31821#issuecomment-3187572025

echo '========================================================================'
cat << EOF
1️⃣  Check whether the flake evaluates and run its tests.
Description:
  This \`nix flake check\` command verifies that the flake specified
  by flake reference flake-url can be evaluated successfully (as
  detailed below), and that the derivations specified by the flake's
  checks output can be built successfully.
  https://nix.dev/manual/nix/latest/command-ref/new-cli/nix3-flake-check
EOF
nix flake check
cat << EOF
✅ The \`nix flake check\` command completed successfully.
EOF

echo '========================================================================'
cat << EOF
2️⃣  Build the default package from the flake in the current directory.
Description:
  The \`nix build\` command builds the specified installables.
  Installables that resolve to derivations are built (or substituted
  if possible).
  Store path installables are substituted.
  Unless \`--no-link\` is specified, after a successful build, it
  creates symlinks to the store paths of the installables.
  These symlinks have the prefix \`./result\` by default.
  https://nix.dev/manual/nix/latest/command-ref/new-cli/nix3-build
EOF

nix build
cat << EOF
✅ The \`nix build\` command completed successfully.
EOF

echo '========================================================================'
echo "3️⃣  Check installables that resolve to derivations are built."
if [ -L 'result' ]; then # Check if `result` directory is a symbolic link.
cat << EOF
✅ Installables are built successfully in the below directory.
`echo $(readlink result)`
EOF
else
cat << EOF
❌ No installables or derivations found.
EOF
fi

echo '========================================================================'
echo "4️⃣  Testing Azure CLI version..."
timeout 30 nix run . -- --version
echo "✅ Azure CLI runs successfully."

echo '========================================================================'
echo "5️⃣  Checking installed extensions..."
echo "Available extensions:"
timeout 60 nix run . -- extension list --output table
echo

echo "6️⃣  Testing extensions..."
extensions=($(timeout 60 nix run . -- extension list --query '[].name' --output tsv 2>/dev/null || echo ""))

if [ ${#extensions[@]} -eq 0 ]; then
    echo "⚠️  No extensions found or failed to retrieve extension list."
    exit 1
fi
echo

for extension in "${extensions[@]}"; do
    echo "Testing ${extension} extension..."

    if [[ "${extension}" == "aks-preview" ]]; then
        extension="aks"
    fi

    if timeout 30 nix run . -- ${extension} --help > /dev/null 2>&1; then
        echo "✅ The azure-cli ${extension} extension is working."
    else
        echo "❌ The azure-cli ${extension} extension not working."
    fi
  echo
done

echo "🎉 All tests completed!"
echo "The flake appears to be working correctly."
