# azure-cli-with-extensions

This Azure Command-Line Interface (CLI) with Extensions Nix's Flake shows how you can override a Nix package to add extensions. In this case, we are installing the [azure-cli](https://learn.microsoft.com/en-us/cli/azure/) package with extra [extensions](https://learn.microsoft.com/en-us/cli/azure/azure-cli-extensions-overview).

## Getting started

```shell
flox init
flox install github:sheeeng/azure-cli-with-extensions # Install from public repository.
flox install git+ssh://git@github.com/sheeeng/azure-cli-with-extensions # Install from private repository.
flox activate
az extension list
```

## License

This project is dual-licensed under the following terms:

`SPDX-License-Identifier: Apache-2.0 OR MIT`

You may choose either:

- Apache License, Version 2.0, ([LICENSE-APACHE](LICENSE-APACHE) or
  <http://www.apache.org/licenses/LICENSE-2.0>)
- MIT license ([LICENSE-MIT](LICENSE-MIT) or
  <http://opensource.org/licenses/MIT>)

at your option.

### Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the Apache-2.0 license, shall be
dual licensed as above, without any additional terms or conditions.
