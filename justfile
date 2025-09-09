NIX_FLAGS := "--experimental-features 'nix-command flakes' --accept-flake-config"

[doc('Update flake.lock file')]
update:
  nix {{ NIX_FLAGS }} flake update --refresh --commit-lock-file

[doc('Update flake.lock file with nom output')]
update-nom:
  nix {{ NIX_FLAGS }} flake update --refresh --commit-lock-file --log-format internal-json --verbose --print-build-logs | nom --json

[doc('Update flake.lock file and save logs to specified file')]
update-to-file LOGFILE:
  #!/usr/bin/env bash
  echo "📝 Saving update logs to: {{ LOGFILE }}"
  nix {{ NIX_FLAGS }} flake update --refresh --commit-lock-file 2>&1 | tee "{{ LOGFILE }}"
  echo "✅ Update completed. Logs saved to: {{ LOGFILE }}"

[doc('Update flake.lock file and save logs with timestamp')]
update-log:
  #!/usr/bin/env bash
  LOGFILE="update-$(date +%Y%m%d-%H%M%S).log"
  echo "📝 Saving update logs to: $LOGFILE"
  nix {{ NIX_FLAGS }} flake update --refresh --commit-lock-file 2>&1 | tee "$LOGFILE"
  echo "✅ Update completed. Logs saved to: $LOGFILE"

[doc('Check flake for errors')]
check:
  nix {{ NIX_FLAGS }} flake check --print-build-logs

[doc('Check flake for errors with nom output')]
check-nom:
  nix {{ NIX_FLAGS }} flake check --log-format internal-json --verbose --print-build-logs | nom --json

[doc('Check flake for errors and save logs to specified file')]
check-to-file LOGFILE:
  #!/usr/bin/env bash
  echo "📝 Saving check logs to: {{ LOGFILE }}"
  nix {{ NIX_FLAGS }} flake check --print-build-logs 2>&1 | tee "{{ LOGFILE }}"
  echo "✅ Check completed. Logs saved to: {{ LOGFILE }}"

[doc('Check flake for errors and save logs with timestamp')]
check-log:
  #!/usr/bin/env bash
  LOGFILE="check-$(date +%Y%m%d-%H%M%S).log"
  echo "📝 Saving check logs to: $LOGFILE"
  nix {{ NIX_FLAGS }} flake check --print-build-logs 2>&1 | tee "$LOGFILE"
  echo "✅ Check completed. Logs saved to: $LOGFILE"
