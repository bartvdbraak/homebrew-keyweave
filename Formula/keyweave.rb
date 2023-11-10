class Keyweave < Formula
  desc "Fetches secrets from Azure Key Vault and weaves them into a convenient .env file"
  homepage "https://github.com/bartvdbraak/keyweave"
  license "GPLv3"
  version "0.2.2"

  option "with-gnu-libc", "Install glibc binary"
  option "with-musl-libc", "Install musl binary (default)"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.2/keyweave-aarch64-apple-darwin.tar.xz"
      sha256 "7e5f5c7a39ea177bd4bf64b4c30402d56b88741ba94c3a2fc20d2fa75da951dc"
    else
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.2/keyweave-x86_64-apple-darwin.tar.xz"
      sha256 "cc1dac0187b27bfa2e5011c8a4854e6a056214de9a53a61ece27f81f731fc723"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.2/keyweave-armv7-unknown-linux-gnueabihf.tar.xz"
        sha256 "98e586db41b7bda881a6b143f8082b0cc3b4084c72590d2aae887a3166cbb4f0"
      else  
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.2/keyweave-aarch64-unknown-linux-gnu.tar.xz"
        sha256 "05bc3577a2533d734343d77d35eed8e3534f3f46ff06abef50b27eeee6ea9df0"
      end
    else      
      if build.with?("with-gnu-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.2/keyweave-x86_64-unknown-linux-gnu.tar.xz"
        sha256 "6c87243d1096b6c952d3a7e13c95cb983cc608b8ea87356bc9eb6fc76376c15e"
      elsif build.with?("with-musl-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.2/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "e5f6686cd81c364c2cafcbb157644a3eaaeeec1d59d260bed8c4eb865678ab14"
      else
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.2/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "e5f6686cd81c364c2cafcbb157644a3eaaeeec1d59d260bed8c4eb865678ab14"
      end
    end
  end

  def install
    bin.install "keyweave"
  end
end
