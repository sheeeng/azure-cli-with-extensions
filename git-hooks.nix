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
    };

    # pre-commit: check-ast → git-hooks.nix: check-python
    check-python = {
      enable = true;
    };

    # pre-commit: check-builtin-literals → git-hooks.nix: check-builtin-literals
    check-builtin-literals = {
      enable = true;
    };

    # pre-commit: check-case-conflict → git-hooks.nix: check-case-conflicts
    check-case-conflicts = {
      enable = true;
    };

    # pre-commit: check-docstring-first → git-hooks.nix: check-docstring-first
    check-docstring-first = {
      enable = true;
    };

    # pre-commit: check-executables-have-shebangs → git-hooks.nix: check-executables-have-shebangs
    check-executables-have-shebangs = {
      enable = true;
    };

    # TODO: pre-commit: check-illegal-windows-names → git-hooks.nix: not available

    # pre-commit: check-json → git-hooks.nix: check-json
    check-json = {
      enable = true;
    };

    # pre-commit: check-merge-conflict → git-hooks.nix: check-merge-conflicts
    check-merge-conflicts = {
      enable = true;
      args = [ "assume-in-merge" ];
    };

    # pre-commit: check-shebang-scripts-are-executable → git-hooks.nix: check-shebang-scripts-are-executable
    check-shebang-scripts-are-executable = {
      enable = true;
    };

    # pre-commit: check-symlinks → git-hooks.nix: check-symlinks
    check-symlinks = {
      enable = true;
    };

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

    # =============================================================================
    # COMMENTED PLACEHOLDERS FOR ALL AVAILABLE HOOKS IN GIT-HOOKS.NIX
    # =============================================================================
    # The following hooks are available in git-hooks.nix but not currently enabled.
    # Uncomment and configure as needed for your project.
    # Reference: https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix

    actionlint = {
      enable = true;
    };

    action-validator = {
      enable = true;
    };

    alejandra = {
      enable = true;
      settings = {
        check = false;
        configPath = null;
        exclude = [ ];
        threads = null;
        verbosity = "quiet";
      };
    };

    # # annex = {
    # #   enable = true;
    # #   # Runs the git-annex hook for large file support
    # # };

    # # ansible-lint = {
    # #   enable = true;
    # #   # Ansible linter
    # #   settings = {
    # #     configPath = "";
    # #     subdir = "";
    # #   };
    # # };

    # # autoflake = {
    # #   enable = true;
    # #   # Remove unused imports and variables from Python code
    # #   settings = {
    # #     binPath = null;
    # #     flags = "--in-place --expand-star-imports --remove-duplicate-keys --remove-unused-variables";
    # #   };
    # # };

    # # bats = {
    # #   enable = true;
    # #   # Run bash unit tests
    # # };

    # # beautysh = {
    # #   enable = true;
    # #   # Format shell files
    # # };

    # # biome = {
    # #   enable = true;
    # #   # A toolchain for web projects, aimed to provide functionalities to maintain them
    # #   settings = {
    # #     binPath = null;
    # #     write = true;
    # #     configPath = "";
    # #   };
    # # };

    # # black = {
    # #   enable = true;
    # #   # The uncompromising Python code formatter
    # #   settings = {
    # #     flags = "";
    # #   };
    # # };

    # # cabal-fmt = {
    # #   enable = true;
    # #   # Format Cabal files
    # # };

    # # cabal-gild = {
    # #   enable = true;
    # #   # Format Cabal files
    # # };

    # # cabal2nix = {
    # #   enable = true;
    # #   # Run `cabal2nix` on all `*.cabal` files to generate corresponding `.nix` files
    # #   settings = {
    # #     outputFilename = "default.nix";
    # #   };
    # # };

    # # cargo-check = {
    # #   enable = true;
    # #   # Check the cargo package for errors
    # # };

    # # checkmake = {
    # #   enable = true;
    # #   # Experimental linter/analyzer for Makefiles
    # # };

    # # chktex = {
    # #   enable = true;
    # #   # LaTeX semantic checker
    # # };

    # # circleci = {
    # #   enable = true;
    # #   # Validate CircleCI config files
    # # };

    # # clang-format = {
    # #   enable = true;
    # #   # Format your code using `clang-format`
    # # };

    # # clang-tidy = {
    # #   enable = true;
    # #   # Static analyzer for C++ code
    # # };

    # # cljfmt = {
    # #   enable = true;
    # #   # A tool for formatting Clojure code
    # # };

    # # clippy = {
    # #   enable = true;
    # #   # Lint Rust code
    # #   settings = {
    # #     denyWarnings = false;
    # #     offline = true;
    # #     allFeatures = false;
    # #     extraArgs = "";
    # #   };
    # # };

    # # cmake-format = {
    # #   enable = true;
    # #   # A tool for formatting CMake-files
    # #   settings = {
    # #     configPath = "";
    # #   };
    # # };

    # # commitizen = {
    # #   enable = true;
    # #   # Check whether the current commit message follows committing rules
    # # };

    # # comrak = {
    # #   enable = true;
    # #   # A 100% CommonMark-compatible GitHub Flavored Markdown formatter
    # # };

    # # conform = {
    # #   enable = true;
    # #   # Policy enforcement for commits
    # # };

    # # convco = {
    # #   enable = true;
    # #   # Conventional commits checker
    # #   settings = {
    # #     configPath = null;
    # #   };
    # # };

    # # credo = {
    # #   enable = true;
    # #   # Runs a static code analysis using Credo
    # #   settings = {
    # #     strict = true;
    # #   };
    # # };

    # # crystal = {
    # #   enable = true;
    # #   # A tool that automatically formats Crystal source code
    # # };

    # # cspell = {
    # #   enable = true;
    # #   # A Spell Checker for Code
    # # };

    # # dart-analyze = {
    # #   enable = true;
    # #   # Dart analyzer
    # # };

    # # dart-format = {
    # #   enable = true;
    # #   # Dart formatter
    # # };

    # # deadnix = {
    # #   enable = true;
    # #   # Scan Nix files for dead code (unused variable bindings)
    # #   settings = {
    # #     edit = false;
    # #     exclude = [ ];
    # #     hidden = false;
    # #     noLambdaArg = false;
    # #     noLambdaPatternNames = false;
    # #     noUnderscore = false;
    # #     quiet = false;
    # #   };
    # # };

    # # denofmt = {
    # #   enable = true;
    # #   # Auto-format JavaScript, TypeScript, Markdown, and JSON files
    # #   settings = {
    # #     write = true;
    # #     configPath = "";
    # #   };
    # # };

    # # denolint = {
    # #   enable = true;
    # #   # Lint JavaScript/TypeScript source code
    # #   settings = {
    # #     format = "default";
    # #     configPath = "";
    # #   };
    # # };

    # # dhall-format = {
    # #   enable = true;
    # #   # Dhall code formatter
    # # };

    # # dialyzer = {
    # #   enable = true;
    # #   # Runs a static code analysis using Dialyzer
    # # };

    # # dune-fmt = {
    # #   enable = true;
    # #   # Runs Dune's formatters on the code tree
    # #   settings = {
    # #     auto-promote = true;
    # #     extraRuntimeInputs = [ ];
    # #   };
    # # };

    # # dune-opam-sync = {
    # #   enable = true;
    # #   # Check that Dune-generated OPAM files are in sync
    # # };

    # # eclint = {
    # #   enable = true;
    # #   # EditorConfig linter written in Go
    # #   settings = {
    # #     fix = false;
    # #     summary = false;
    # #     color = "auto";
    # #     exclude = [ ];
    # #     verbosity = 0;
    # #   };
    # # };

    # # editorconfig-checker = {
    # #   enable = true;
    # #   # Verify that the files are in harmony with the `.editorconfig`
    # # };

    # # elm-format = {
    # #   enable = true;
    # #   # Format Elm files
    # # };

    # # elm-review = {
    # #   enable = true;
    # #   # Analyzes Elm projects, to help find mistakes before your users find them
    # # };

    # # elm-test = {
    # #   enable = true;
    # #   # Run unit tests and fuzz tests for Elm code
    # # };

    # # eslint = {
    # #   enable = true;
    # #   # Find and fix problems in your JavaScript code
    # #   settings = {
    # #     binPath = null;
    # #     extensions = "\\.js$";
    # #   };
    # # };

    # # fix-encoding-pragma = {
    # #   enable = true;
    # #   # Adds # -*- coding: utf-8 -*- to the top of Python files
    # # };

    # # flake8 = {
    # #   enable = true;
    # #   # Check the style and quality of Python files
    # #   settings = {
    # #     binPath = null;
    # #     extendIgnore = [ ];
    # #     format = "default";
    # #   };
    # # };

    # # flake-checker = {
    # #   enable = true;
    # #   # Run health checks on your flake-powered Nix projects
    # # };

    # # flynt = {
    # #   enable = true;
    # #   # CLI tool to convert a python project's %-formatted strings to f-strings
    # #   settings = {
    # #     aggressive = false;
    # #     binPath = null;
    # #     dry-run = false;
    # #     exclude = [ ];
    # #     fail-on-change = true;
    # #     line-length = null;
    # #     no-multiline = false;
    # #     quiet = false;
    # #     string = false;
    # #     transform-concats = false;
    # #     verbose = false;
    # #   };
    # # };

    # # fourmolu = {
    # #   enable = true;
    # #   # Haskell code prettifier
    # #   settings = {
    # #     defaultExtensions = [ ];
    # #   };
    # # };

    # # fprettify = {
    # #   enable = true;
    # #   # Auto-formatter for modern Fortran code
    # # };

    # # gitlint = {
    # #   enable = true;
    # #   # Linting for your git commit messages
    # # };

    # # gofmt = {
    # #   enable = true;
    # #   # A tool that automatically formats Go source code
    # # };

    # # golangci-lint = {
    # #   enable = true;
    # #   # Fast linters runner for Go
    # # };

    # # golines = {
    # #   enable = true;
    # #   # A golang formatter that fixes long lines
    # #   settings = {
    # #     flags = "";
    # #   };
    # # };

    # # gotest = {
    # #   enable = true;
    # #   # Run go tests
    # #   settings = {
    # #     flags = "";
    # #   };
    # # };

    # # govet = {
    # #   enable = true;
    # #   # Checks correctness of Go programs
    # # };

    # # gptcommit = {
    # #   enable = true;
    # #   # Generate a commit message using GPT3
    # # };

    # # hadolint = {
    # #   enable = true;
    # #   # Dockerfile linter, validate inline bash
    # # };

    # # headache = {
    # #   enable = true;
    # #   # Lightweight tool for managing headers in source code files
    # #   settings = {
    # #     header-file = ".header";
    # #   };
    # # };

    # # hindent = {
    # #   enable = true;
    # #   # Haskell code prettifier
    # # };

    # # hlint = {
    # #   enable = true;
    # #   # HLint gives suggestions on how to improve your source code
    # #   settings = {
    # #     hintFile = null;
    # #   };
    # # };

    # # hpack = {
    # #   enable = true;
    # #   # `hpack` converts package definitions in the hpack format (`package.yaml`) to Cabal files
    # #   settings = {
    # #     silent = false;
    # #   };
    # # };

    # # html-tidy = {
    # #   enable = true;
    # #   # HTML linter
    # # };

    # # hunspell = {
    # #   enable = true;
    # #   # Spell checker and morphological analyzer
    # # };

    # # isort = {
    # #   enable = true;
    # #   # A Python utility / library to sort imports
    # #   settings = {
    # #     profile = "";
    # #     flags = "";
    # #   };
    # # };

    # # juliaformatter = {
    # #   enable = true;
    # #   # Run JuliaFormatter.jl against Julia source files
    # # };

    # # lacheck = {
    # #   enable = true;
    # #   # A consistency checker for LaTeX documents
    # # };

    # # latexindent = {
    # #   enable = true;
    # #   # Perl script to add indentation to LaTeX files
    # #   settings = {
    # #     flags = "--local --silent --overwriteIfDifferent";
    # #   };
    # # };

    # # lua-ls = {
    # #   enable = true;
    # #   # Uses the lua-language-server CLI to statically type-check and lint Lua code
    # #   settings = {
    # #     checklevel = "Warning";
    # #     configuration = { };
    # #   };
    # # };

    # # luacheck = {
    # #   enable = true;
    # #   # A tool for linting and static analysis of Lua code
    # # };

    # # lychee = {
    # #   enable = true;
    # #   # A fast, async, stream-based link checker that finds broken hyperlinks and mail addresses
    # #   settings = {
    # #     configPath = "";
    # #     flags = "";
    # #   };
    # # };

    # # markdownlint = {
    # #   enable = true;
    # #   # Style checker and linter for markdown files
    # #   settings = {
    # #     configuration = { };
    # #   };
    # # };

    # # mdformat = {
    # #   enable = true;
    # #   # CommonMark compliant Markdown formatter
    # # };

    # # mdl = {
    # #   enable = true;
    # #   # A tool to check markdown files and flag style issues
    # #   settings = {
    # #     configPath = "";
    # #     git-recurse = false;
    # #     ignore-front-matter = false;
    # #     json = false;
    # #     rules = [ ];
    # #     rulesets = [ ];
    # #     show-aliases = false;
    # #     warnings = false;
    # #     skip-default-ruleset = false;
    # #     style = "default";
    # #     tags = [ ];
    # #     verbose = false;
    # #   };
    # # };

    # # mdsh = {
    # #   enable = true;
    # #   # Markdown shell pre-processor
    # # };

    # # mix-format = {
    # #   enable = true;
    # #   # Runs the built-in Elixir syntax formatter
    # # };

    # # mix-test = {
    # #   enable = true;
    # #   # Runs the built-in Elixir test framework
    # # };

    # # mkdocs-linkcheck = {
    # #   enable = true;
    # #   # Validate links associated with markdown-based, statically generated websites
    # #   settings = {
    # #     binPath = null;
    # #     path = "";
    # #     local-only = false;
    # #     recurse = false;
    # #     extension = "";
    # #     method = "get";
    # #   };
    # # };

    # # mypy = {
    # #   enable = true;
    # #   # Static type checker for Python
    # #   settings = {
    # #     binPath = null;
    # #   };
    # # };

    # # nbstripout = {
    # #   enable = true;
    # #   # Strip output from Jupyter notebooks
    # # };

    # # nil = {
    # #   enable = true;
    # #   # Incremental analysis assistant for writing in Nix
    # # };

    # # nixfmt = {
    # #   enable = true;
    # #   # Deprecated nixfmt hook. Use nixfmt-classic or nixfmt-rfc-style instead
    # #   settings = {
    # #     width = null;
    # #   };
    # # };

    # # nixfmt-classic = {
    # #   enable = true;
    # #   # nixfmt (classic) hook
    # #   settings = {
    # #     width = null;
    # #   };
    # # };

    nixfmt-rfc-style = {
      enable = true;
    };

    # # nixpkgs-fmt = {
    # #   enable = true;
    # #   # Nix code prettifier
    # # };

    # # ocp-indent = {
    # #   enable = true;
    # #   # A tool to indent OCaml code
    # # };

    # # opam-lint = {
    # #   enable = true;
    # #   # OCaml package manager configuration checker
    # # };

    # # openapi-spec-validator = {
    # #   enable = true;
    # #   # A tool to validate OpenAPI spec files
    # # };

    # # ormolu = {
    # #   enable = true;
    # #   # Haskell code prettifier
    # #   settings = {
    # #     defaultExtensions = [ ];
    # #     cabalDefaultExtensions = false;
    # #   };
    # # };

    # # php-cs-fixer = {
    # #   enable = true;
    # #   # Lint PHP files
    # #   settings = {
    # #     binPath = null;
    # #   };
    # # };

    # # phpcbf = {
    # #   enable = true;
    # #   # Lint PHP files
    # #   settings = {
    # #     binPath = null;
    # #   };
    # # };

    # # phpcs = {
    # #   enable = true;
    # #   # Lint PHP files
    # #   settings = {
    # #     binPath = null;
    # #   };
    # # };

    # # phpstan = {
    # #   enable = true;
    # #   # Static Analysis of PHP files
    # #   settings = {
    # #     binPath = null;
    # #   };
    # # };

    # # poetry-check = {
    # #   enable = true;
    # #   # Check the Poetry config for errors
    # # };

    # # poetry-lock = {
    # #   enable = true;
    # #   # Update the Poetry lock file
    # # };

    # # pre-commit-hook-ensure-sops = {
    # #   enable = true;
    # #   # Ensure that all encrypted files are also tracked by sops
    # # };

    # # prettier = {
    # #   enable = true;
    # #   # Opinionated multi-language code formatter
    # #   settings = {
    # #     binPath = null;
    # #     allow-parens = "always";
    # #     bracket-same-line = false;
    # #     cache = false;
    # #     cache-location = "./node_modules/.cache/prettier/.prettier-cache";
    # #     cache-strategy = null;
    # #     check = false;
    # #     list-different = true;
    # #     color = true;
    # #     configPath = "";
    # #     config-precedence = "cli-override";
    # #     embedded-language-formatting = "auto";
    # #     end-of-line = "lf";
    # #     html-whitespace-sensitivity = "css";
    # #     ignore-path = [ ];
    # #     ignore-unknown = true;
    # #     insert-pragma = false;
    # #     jsx-single-quote = false;
    # #     log-level = "log";
    # #     no-bracket-spacing = false;
    # #     no-config = false;
    # #     no-editorconfig = false;
    # #     no-error-on-unmatched-pattern = false;
    # #     no-semi = false;
    # #     parser = "";
    # #     print-width = 80;
    # #     prose-wrap = "preserve";
    # #     plugins = [ ];
    # #     quote-props = "as-needed";
    # #     require-pragma = false;
    # #     single-attribute-per-line = false;
    # #     single-quote = false;
    # #     tab-width = 2;
    # #     trailing-comma = "all";
    # #     use-tabs = false;
    # #     vue-indent-script-and-style = false;
    # #     with-node-modules = false;
    # #     write = true;
    # #   };
    # # };

    # # proselint = {
    # #   enable = true;
    # #   # A linter for prose
    # #   settings = {
    # #     config = "";
    # #     configPath = "";
    # #     flags = "";
    # #   };
    # # };

    # # psalm = {
    # #   enable = true;
    # #   # Static Analysis of PHP files
    # #   settings = {
    # #     binPath = null;
    # #   };
    # # };

    # # purs-tidy = {
    # #   enable = true;
    # #   # Format purescript files
    # # };

    # # purty = {
    # #   enable = true;
    # #   # Format purescript files
    # # };

    # # pylint = {
    # #   enable = true;
    # #   # Lint Python files
    # #   settings = {
    # #     binPath = null;
    # #     reports = false;
    # #     score = true;
    # #   };
    # # };

    # # pyright = {
    # #   enable = true;
    # #   # Static type checker for Python
    # #   settings = {
    # #     binPath = null;
    # #   };
    # # };

    # # pyupgrade = {
    # #   enable = true;
    # #   # Automatically upgrade syntax for newer versions
    # #   settings = {
    # #     binPath = null;
    # #   };
    # # };

    # # reuse = {
    # #   enable = true;
    # #   # reuse is a tool for compliance with the REUSE recommendations
    # #   settings = {
    # #     flags = "";
    # #   };
    # # };

    # # revive = {
    # #   enable = true;
    # #   # A linter for Go source code
    # #   settings = {
    # #     configPath = "";
    # #   };
    # # };

    # # ripsecrets = {
    # #   enable = true;
    # #   # Prevent committing secret keys into your source code
    # #   settings = {
    # #     additionalPatterns = [ ];
    # #   };
    # # };

    # # rome = {
    # #   enable = true;
    # #   # Deprecated rome hook. Use biome instead
    # #   settings = {
    # #     binPath = null;
    # #     write = true;
    # #     configPath = "";
    # #   };
    # # };

    # # ruff = {
    # #   enable = true;
    # #   # An extremely fast Python linter, written in Rust
    # # };

    # # ruff-format = {
    # #   enable = true;
    # #   # An extremely fast Python code formatter, written in Rust
    # # };

    # # rustfmt = {
    # #   enable = true;
    # #   # Format Rust code
    # #   settings = {
    # #     all = true;
    # #     check = false;
    # #     color = "always";
    # #     config = { };
    # #     config-path = null;
    # #     emit = null;
    # #     files-with-diff = false;
    # #     manifest-path = null;
    # #     message-format = null;
    # #     package = [ ];
    # #     verbose = false;
    # #   };
    # # };

    # # selene = {
    # #   enable = true;
    # #   # A blazing-fast modern Lua linter written in Rust
    # # };

    # # shellcheck = {
    # #   enable = true;
    # #   # Format shell files
    # # };

    # # shfmt = {
    # #   enable = true;
    # #   # Format shell files
    # #   settings = {
    # #     simplify = true;
    # #   };
    # # };

    # # staticcheck = {
    # #   enable = true;
    # #   # State of the art linter for the Go programming language
    # # };

    # # statix = {
    # #   enable = true;
    # #   # Lints and suggestions for the Nix programming language
    # #   settings = {
    # #     config = null;
    # #     format = "errfmt";
    # #     ignore = [ ];
    # #     unrestricted = false;
    # #   };
    # # };

    # # stylish-haskell = {
    # #   enable = true;
    # #   # A simple Haskell code prettifier
    # # };

    # # stylua = {
    # #   enable = true;
    # #   # An Opinionated Lua Code Formatter
    # # };

    # # tagref = {
    # #   enable = true;
    # #   # Have tagref check all references and tags
    # # };

    # # taplo = {
    # #   enable = true;
    # #   # Format TOML files with taplo fmt
    # # };

    # # terraform-format = {
    # #   enable = true;
    # #   # Format Terraform (`.tf`) files
    # # };

    # # terraform-validate = {
    # #   enable = true;
    # #   # Validates terraform configuration files (`.tf`)
    # # };

    # # tflint = {
    # #   enable = true;
    # #   # A Pluggable Terraform Linter
    # # };

    # # topiary = {
    # #   enable = true;
    # #   # A universal formatter engine within the Tree-sitter ecosystem, with support for many languages
    # # };

    # # treefmt = {
    # #   enable = true;
    # #   # One CLI to format the code tree
    # #   settings = {
    # #     fail-on-change = true;
    # #     no-cache = true;
    # #     formatters = [ ];
    # #   };
    # # };

    # # trufflehog = {
    # #   enable = true;
    # #   # Secrets scanner
    # # };

    # # typos = {
    # #   enable = true;
    # #   # Source code spell checker
    # #   settings = {
    # #     binary = false;
    # #     color = "auto";
    # #     config = { };
    # #     configPath = "";
    # #     diff = false;
    # #     exclude = [ ];
    # #     force-exclude = true;
    # #     format = "long";
    # #     hidden = false;
    # #     ignored-words = [ ];
    # #     locale = "en";
    # #     no-check-filenames = false;
    # #     no-check-files = false;
    # #     no-unicode = false;
    # #     quiet = false;
    # #     verbose = false;
    # #     write = false;
    # #   };
    # # };

    # # typstfmt = {
    # #   enable = true;
    # #   # format typst
    # # };

    # # typstyle = {
    # #   enable = true;
    # #   # Beautiful and reliable typst code formatter
    # # };

    # # uv-check = {
    # #   enable = true;
    # #   # Check if uv's lockfile is up-to-date
    # # };

    # # uv-export = {
    # #   enable = true;
    # #   # Export uv's lockfile
    # #   settings = {
    # #     format = "pylock.toml";
    # #     locked = true;
    # #     flags = "";
    # #   };
    # # };

    # # uv-lock = {
    # #   enable = true;
    # #   # Update uv's lockfile
    # # };

    # # vale = {
    # #   enable = true;
    # #   # A markup-aware linter for prose built with speed and extensibility in mind
    # #   settings = {
    # #     configuration = "";
    # #     configPath = "";
    # #     flags = "";
    # #   };
    # # };

    # # woodpecker-cli-lint = {
    # #   enable = true;
    # #   # Command line client for the Woodpecker Continuous Integration server (lint only)
    # #   settings = {
    # #     workflowPath = "";
    # #     strict = false;
    # #     pluginsPrivileged = "";
    # #     pluginsTrustedClone = "";
    # #   };
    # # };

    # # yamlfmt = {
    # #   enable = true;
    # #   # Formatter for YAML files
    # #   settings = {
    # #     configPath = "";
    # #     lint-only = true;
    # #   };
    # # };

    # # yamllint = {
    # #   enable = true;
    # #   # Linter for YAML files
    # #   settings = {
    # #     configuration = "";
    # #     configData = "";
    # #     configPath = "";
    # #     format = "auto";
    # #     preset = "default";
    # #     strict = true;
    # #   };
    # # };

    # # zizmor = {
    # #   enable = true;
    # #   # Static analysis for GitHub Actions
    # # };

    # # zprint = {
    # #   enable = true;
    # #   # Beautifully format Clojure and Clojurescript source code and s-expressions
    # # };
  };
}
