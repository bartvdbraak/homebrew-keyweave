class Keyweave < Formula
  desc "Fetches secrets from Azure Key Vault and weaves them into a convenient .env file"
  homepage "https://github.com/bartvdbraak/keyweave"
  license "GPLv3"
  version "0.2.5"

  option "with-gnu-libc", "Install glibc binary"
  option "with-musl-libc", "Install musl binary (default)"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.5/keyweave-aarch64-apple-darwin.tar.xz"
      sha256 "f9da3c84c972e4cc009366b1c421c37bd9e344f30c16b307b45ea3cabf82954b"
    else
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.5/keyweave-x86_64-apple-darwin.tar.xz"
      sha256 "de3b8248c1f73719a11a23626d492a5f2a3f543657c35fbb321c745043569d77"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.5/keyweave-armv7-unknown-linux-gnueabihf.tar.xz"
        sha256 "c44949983155f7c567ff31dd3d08f069422a121ca7fab5b6a2bbc917a728ae22"
      else  
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.5/keyweave-aarch64-unknown-linux-gnu.tar.xz"
        sha256 "74693a91c19621d908f38d570fc4502f5de55c8241758d54c891db48ae8dbe58"
      end
    else      
      if build.with?("with-gnu-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.5/keyweave-x86_64-unknown-linux-gnu.tar.xz"
        sha256 "e142d7dad14760a0db822d59680afe3cc0ff1214ba85375c30a8998715a4b5cd"
      elsif build.with?("with-musl-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.5/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "5c8df2a7cc1f31028ba8833b5778efceacc2f7ee27479955522fa7212ad57dc6"
      else
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.5/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "5c8df2a7cc1f31028ba8833b5778efceacc2f7ee27479955522fa7212ad57dc6"
      end
    end
  end

  def install
    bin.install "keyweave"
  end
end
