class Keyweave < Formula
  desc "Fetches secrets from Azure Key Vault and weaves them into a convenient .env file"
  homepage "https://github.com/bartvdbraak/keyweave"
  license "GPLv3"
  version "0.2.1"

  option "with-gnu-libc", "Install glibc binary"
  option "with-musl-libc", "Install musl binary (default)"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.1/keyweave-aarch64-apple-darwin.tar.xz"
      sha256 "a9006b2c2c2a1e4b6090bf4ef629fa063760d08871fd0e9c199abb755600b276"
    else
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.1/keyweave-x86_64-apple-darwin.tar.xz"
      sha256 "e27ef21ce7bdc3b8bff23cb932e2f9b3bc72f47bae010035fefaf5d9b6206150"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.1/keyweave-armv7-unknown-linux-gnueabihf.tar.xz"
        sha256 "1f4b90d1c70591e2000bc3310628ae940810037bc8d70dab4f079aab44f82bf6"
      else  
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.1/keyweave-aarch64-unknown-linux-gnu.tar.xz"
        sha256 "466fd6dd06707a12f5a60655652be85c60a92118cd668a17894810a96d4e184b"
      end
    else      
      if build.with?("with-gnu-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.1/keyweave-x86_64-unknown-linux-gnu.tar.xz"
        sha256 "ea08980135a71111ca89938176eae04a560c4cb5bf75e31dba08162f16d9c02c"
      elsif build.with?("with-musl-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.1/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "e6c0dec1c1252b1c948455f59e94222a27e6e5cefe853577d2ec243bdc55c5af"
      else
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.1/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "e6c0dec1c1252b1c948455f59e94222a27e6e5cefe853577d2ec243bdc55c5af"
      end
    end
  end

  def install
    bin.install "keyweave"
  end
end
