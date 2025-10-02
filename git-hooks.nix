# Pre-commit hooks configuration using git-hooks.nix
# https://github.com/cachix/git-hooks.nix
#
# Hook naming reference:
# - Old pre-commit hooks:
# https://github.com/pre-commit/pre-commit-hooks/blob/main/.pre-commit-hooks.yaml
# https://github.com/pre-commit/pre-commit-hooks/blob/a2cdab0afed18f1b2b073c3f7b68f109fd228d04/.pre-commit-hooks.yaml
# - New git-hooks.nix:
# https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix
# https://github.com/cachix/git-hooks.nix/blob/54df955a695a84cd47d4a43e08e1feaf90b1fd9b/modules/hooks.nix
#
{ pkgs }:
{
  src = ./.;
  hooks = {
    # pre-commit: check-added-large-files → git-hooks.nix: check-added-large-files
    check-added-large-files = {
      enable = true;
      args = [ "--maxkb=10240" ];
    }; # https://github.com/cachix/git-hooks.nix/blob/54df955a695a84cd47d4a43e08e1feaf90b1fd9b/modules/hooks.nix#L2321

    # pre-commit: check-ast → git-hooks.nix: check-python
    check-python = {
      enable = true;
    }; # https://github.com/cachix/git-hooks.nix/blob/54df955a695a84cd47d4a43e08e1feaf90b1fd9b/modules/hooks.nix#L2378

    # pre-commit: check-builtin-literals → git-hooks.nix: check-builtin-literals
    check-builtin-literals = {
      enable = true;
    }; # https://github.com/cachix/git-hooks.nix/blob/54df955a695a84cd47d4a43e08e1feaf90b1fd9b/modules/hooks.nix#L2329

    # pre-commit: check-case-conflict → git-hooks.nix: check-case-conflicts
    check-case-conflicts = {
      enable = true;
    }; # https://github.com/cachix/git-hooks.nix/blob/54df955a695a84cd47d4a43e08e1feaf90b1fd9b/modules/hooks.nix#L2337

    # pre-commit: check-docstring-first → git-hooks.nix: check-docstring-first
    check-docstring-first = {
      enable = true;
    }; # https://github.com/cachix/git-hooks.nix/blob/54df955a695a84cd47d4a43e08e1feaf90b1fd9b/modules/hooks.nix#L2345

    # pre-commit: check-executables-have-shebangs → git-hooks.nix: check-executables-have-shebangs
    check-executables-have-shebangs = {
      enable = true;
    }; # https://github.com/cachix/git-hooks.nix/blob/54df955a695a84cd47d4a43e08e1feaf90b1fd9b/modules/hooks.nix#L2353

    # TODO: pre-commit: check-illegal-windows-names → git-hooks.nix: not available

    # pre-commit: check-json → git-hooks.nix: check-json
    check-json = {
      enable = true;
    }; # https://github.com/cachix/git-hooks.nix/blob/54df955a695a84cd47d4a43e08e1feaf90b1fd9b/modules/hooks.nix#L2362

    # pre-commit: check-merge-conflict → git-hooks.nix: check-merge-conflicts
    check-merge-conflicts = {
      enable = true;
      args = [ "assume-in-merge" ];
    };

    # pre-commit: check-shebang-scripts-are-executable → git-hooks.nix: check-shebang-scripts-are-executable
    check-shebang-scripts-are-executable = {
      enable = true;
    }; # https://github.com/cachix/git-hooks.nix/blob/54df955a695a84cd47d4a43e08e1feaf90b1fd9b/modules/hooks.nix#L2370

    # pre-commit: check-symlinks → git-hooks.nix: check-symlinks
    check-symlinks = {
      enable = true;
    }; # https://github.com/cachix/git-hooks.nix/blob/54df955a695a84cd47d4a43e08e1feaf90b1fd9b/modules/hooks.nix#L2395

    # pre-commit: check-toml → git-hooks.nix: check-toml
    check-toml = {
      enable = true;
    };

    # pre-commit: check-vcs-permalinks → git-hooks.nix: check-vcs-permalinks
    check-vcs-permalinks = {
      enable = true;
    };

    # pre-commit: check-xml → git-hooks.nix: check-xml
    check-xml = {
      enable = true;
    };

    # pre-commit: check-yaml → git-hooks.nix: check-yaml
    check-yaml = {
      enable = true;
    };

    # pre-commit: debug-statements → git-hooks.nix: python-debug-statements
    python-debug-statements = {
      enable = true;
    };

    # TODO: pre-commit: destroyed-symlinks → git-hooks.nix: not available

    # pre-commit: detect-aws-credentials → git-hooks.nix: detect-aws-credentials
    detect-aws-credentials = {
      enable = true;
      args = [ "--allow-missing-credentials" ];
    };

    # pre-commit: detect-private-key → git-hooks.nix: detect-private-keys
    detect-private-keys = {
      enable = true;
    };

    # pre-commit: double-quote-string-fixer → git-hooks.nix: single-quoted-strings
    single-quoted-strings = {
      enable = true;
    };

    # pre-commit: end-of-file-fixer → git-hooks.nix: end-of-file-fixer
    end-of-file-fixer = {
      enable = true;
      excludes = [
        ".*\\.lock$"
        ".flox/env.json"
      ];
    };

    # pre-commit: file-contents-sorter → git-hooks.nix: sort-file-contents
    sort-file-contents = {
      enable = true;
      files = "^$";
    };

    # pre-commit: fix-byte-order-marker → git-hooks.nix: fix-byte-order-marker
    fix-byte-order-marker = {
      enable = true;
    };

    # pre-commit: forbid-new-submodules → git-hooks.nix: forbid-new-submodules
    forbid-new-submodules = {
      enable = true;
    };

    # TODO: pre-commit: forbid-submodules → git-hooks.nix: not available

    # pre-commit: mixed-line-ending → git-hooks.nix: mixed-line-endings
    #
    # TODO: git-hooks.nix doesn't support multiple instances of the same hook.
    # with different configurations like pre-commit does. This is a simplified version.
    # - id: mixed-line-ending
    #   name: mixed-line-ending-crlf-for-powershell-files
    #   args: [--fix=crlf]
    #   files: \.(ps1|psm1|psd1|pwsh)$
    # - id: mixed-line-ending
    #   name: mixed-line-ending-lf-for-other-files
    #   args: [--fix=lf]
    #   exclude: \.(ps1|psm1|psd1|pwsh)$
    mixed-line-endings = {
      enable = true;
    };

    # pre-commit: name-tests-test → git-hooks.nix: name-tests-test
    name-tests-test = {
      enable = true;
    };

    # pre-commit: no-commit-to-branch → git-hooks.nix: no-commit-to-branch
    no-commit-to-branch = {
      enable = true;
      stages = [ "manual" ];
    };

    # pre-commit: pretty-format-json → git-hooks.nix: pretty-format-json
    pretty-format-json = {
      enable = true;
      settings = {
        autofix = true;
        no-ensure-ascii = true;
        no-sort-keys = true;
        indent = 2;
      };
      files = "\.json$";
      excludes = [
        ".*\\.lock$"
        "flake\\.lock"
      ];
    };

    # pre-commit: requirements-txt-fixer → git-hooks.nix: sort-requirements-txt
    sort-requirements-txt = {
      enable = true;
    };

    # pre-commit: sort-simple-yaml → git-hooks.nix: sort-simple-yaml
    sort-simple-yaml = {
      enable = true;
      files = "^$";
    };

    # pre-commit: trailing-whitespace → git-hooks.nix: trim-trailing-whitespace
    trim-trailing-whitespace = {
      enable = true;
      args = [ "--markdown-linebreak-ext=md" ];
      excludes = [ "\.md$" ];
    };

    nixfmt-rfc-style = {
      enable = true;
    };
  };
}
