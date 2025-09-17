# Copilot Instructions

## Journals

- Use proper grammar and punctuation in journals.
- Use ISO8601 timestamps from terminal.
- Read [copilot-journals.md](./copilot-journals.md) for history.
- Save summaries in [copilot-journals.md](./copilot-journals.md).
- Organize entries chronologically, newest first.

## Commands

Use GNU-style explicit arguments over abbreviated ones. Example: Use `date --universal +"%Y-%m-%dT%H:%M:%SZ"` over `date -u +"%Y-%m-%dT%H:%M:%SZ"`. Use `set -o errexit` over `set -e` in shell scripts.

Save suggested nix commands in [copilot-commands.md](./copilot-commands.md).

## Markdown

Use [reference-style links][reference-style-links].

## Nix

- Use Nix packages, not Homebrew on macOS.
- Install GNU tools when available.
- Search Nix store paths for dependencies.
- Use identical shells from `nix develop` and `nix-shell`.
- Reference [Nix manual][nix-manual] and [Noogle][noogle].
- Use `nix-prefetch-git` for `sha256` or `lib.fakeSha256` placeholder.
- Install from `nixpkgs-unstable`.

## Instructions

Add development information and instructions to this file accordingly.

Avoid unnecessary comments whenever possible. Use correct punctuations for comments.

Suggest concise, "Don't Repeat Yourself" (DRY), short, maintainable solutions.
Suggest modifications to lists that are alphanumerically sorted in ascending
order.

Do not automatically run commands in the terminal without explicit approval,
except for read-only commands like `nix eval`, `nix search`, `nix flake show`,
`git status`, `ls`, etc. Do not automatically commit changes to files without
explicit approval. Do not automatically push changes to remote repositories
without explicit approval. Do not automatically create pull requests to remote
repositories without explicit approval.

Keep comments if links are provided.

Use GNU-style explicit arguments over abbreviated ones. Example: Use `date --universal +"%Y-%m-%dT%H:%M:%SZ"` over `date -u +"%Y-%m-%dT%H:%M:%SZ"`. Use `set -o errexit` over `set -e` in shell scripts.

Discard all empty trailing whitespace from every file, except Markdown files.

[reference-style-links]: https://www.markdownguide.org/basic-syntax/#reference-style-links
[nix-manual]: https://nixos.org/manual/nix
[noogle]: https://noogle.dev
