# Homebrew Keyweave Formula

## Description

This Homebrew formula provides a convenient way to install [Keyweave](https://github.com/bartvdbraak/keyweave) on macOS and Linux systems. Keyweave is a tool that fetches secrets from Azure Key Vault and weaves them into a convenient .env file. This formula supports multiple architectures and libc variations, making it versatile for various system configurations.

## Installation

You can use this formula to install Keyweave using Homebrew. First, tap into this repository:

```bash
brew tap bartvdbraak/keyweave
```

Then, install Keyweave:

```bash
brew install keyweave
```

## Options

This formula supports a few options that allow you to customize the installation:

- `with-gnu-libc`: Install the glibc binary (GNU C Library).
- `with-musl-libc`: Install the musl binary (default).

## Version

The current version of Keyweave provided by this formula can be found within the formula file.

## Supported Platforms

This formula supports macOS and Linux, and it is compatible with various CPU architectures.

### macOS

- For Apple Silicon (ARM) Macs
- For Intel (x86_64) Macs

### Linux

- For ARM Linux systems:
  - For 32-bit ARM systems
  - For 64-bit ARM systems
- For x86_64 Linux systems:
  - For glibc-based systems (GNU C Library)
  - For musl-based systems

## Usage

Once you've installed Keyweave, you can use it to fetch secrets from Azure Key Vault and weave them into a convenient .env file. For detailed usage instructions and examples, please refer to the [Keyweave GitHub repository](https://github.com/bartvdbraak/keyweave).

## Automatic Updates

This formula is automatically updated using a GitHub workflow. The source code repository for this formula is [github.com/bartvdbraak/keyweave](https://github.com/bartvdbraak/keyweave).

---

**Note:** This formula is provided under the GNU General Public License version 3 (GPLv3). For more information about the license, please refer to the [LICENSE](LICENSE) file in the formula repository. If you encounter any issues or have questions about the formula, please open an issue on the [GitHub repository](https://github.com/bartvdbraak/homebrew-keyweave).

Enjoy using Keyweave with Homebrew!