class Keyweave < Formula
  desc "Fetches secrets from Azure Key Vault and weaves them into a convenient .env file"
  homepage "https://github.com/bartvdbraak/keyweave"
  license "GPLv3"
  version "0.3.1"

  option "with-gnu-libc", "Install glibc binary"
  option "with-musl-libc", "Install musl binary (default)"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.3.1/keyweave-aarch64-apple-darwin.tar.xz"
      sha256 "e69401eb3ae3da6552b18597c39d4c6e3e478e2fbd885635baa5d9b1c21f18b2"
    else
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.3.1/keyweave-x86_64-apple-darwin.tar.xz"
      sha256 "2d3738c3c0df880f6fee1a178ad6f62136e129436f5ee53210509b6a9131c461"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.3.1/keyweave-armv7-unknown-linux-gnueabihf.tar.xz"
        sha256 "f704de7b1841f35e7f78006d06ef4acdfa4e242291720ec908a9baca1003dafe"
      else  
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.3.1/keyweave-aarch64-unknown-linux-gnu.tar.xz"
        sha256 "23a6f41d55abf39d591f5d6e0b2c6e1e83f296f1a84ee24c34b0348b4f73daff"
      end
    else      
      if build.with?("with-gnu-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.3.1/keyweave-x86_64-unknown-linux-gnu.tar.xz"
        sha256 "0a2d765d7e80e6a68715f0dfe9598bbb72c503f4c5cb0c6eb0fef9bc012c01a1"
      elsif build.with?("with-musl-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.3.1/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "bfbf28a5ad33ba4169a1a2fdcf3eb8fb73700645e136f0b0fbbfda93c38ec257"
      else
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.3.1/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "bfbf28a5ad33ba4169a1a2fdcf3eb8fb73700645e136f0b0fbbfda93c38ec257"
      end
    end
  end

  def install
    bin.install "keyweave"
  end
end
