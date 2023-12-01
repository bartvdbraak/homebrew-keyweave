class Keyweave < Formula
  desc "Fetches secrets from Azure Key Vault and weaves them into a convenient .env file"
  homepage "https://github.com/bartvdbraak/keyweave"
  license "GPLv3"
  version "0.2.4"

  option "with-gnu-libc", "Install glibc binary"
  option "with-musl-libc", "Install musl binary (default)"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.4/keyweave-aarch64-apple-darwin.tar.xz"
      sha256 "31849f5746de73023885617a4daad7723b7cb57db87a75ac392f3d32a3463e69"
    else
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.4/keyweave-x86_64-apple-darwin.tar.xz"
      sha256 "eb49217ca753cba5dc99095686beef0691325cb70f235fc4ae0f893a749d26a0"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.4/keyweave-armv7-unknown-linux-gnueabihf.tar.xz"
        sha256 "24e2ef1631264213d7fdfd320c0321e76c882e3def0fc68042280066e6a22526"
      else  
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.4/keyweave-aarch64-unknown-linux-gnu.tar.xz"
        sha256 "dfda55b192ab09378338fa7f03d6d85c2f0c50313e7cbbaa536bd3e99d8defd8"
      end
    else      
      if build.with?("with-gnu-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.4/keyweave-x86_64-unknown-linux-gnu.tar.xz"
        sha256 "daebe9267b134dae12bc93e4a2e4715d5921d21b366bad7cc796de2bb9e8cfd5"
      elsif build.with?("with-musl-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.4/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "0b144c2c587dc4180afcf2d61dd63cf5a1f9a0e483a1d5740869e706ab340bfd"
      else
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.4/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "0b144c2c587dc4180afcf2d61dd63cf5a1f9a0e483a1d5740869e706ab340bfd"
      end
    end
  end

  def install
    bin.install "keyweave"
  end
end
