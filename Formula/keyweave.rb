class Keyweave < Formula
  desc "Fetches secrets from Azure Key Vault and weaves them into a convenient .env file"
  homepage "https://github.com/bartvdbraak/keyweave"
  license "GPLv3"
  version "0.2.6"

  option "with-gnu-libc", "Install glibc binary"
  option "with-musl-libc", "Install musl binary (default)"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.6/keyweave-aarch64-apple-darwin.tar.xz"
      sha256 "72fa1cfcbd95bed95f1e6c75891ca3ce3b652e2496f2bc24d72259790ed472d7"
    else
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.6/keyweave-x86_64-apple-darwin.tar.xz"
      sha256 "3b58115dc53f0e1ee056185383cd8cb5eb5c8e8329fe107e2de1d1bbeaa71822"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.6/keyweave-armv7-unknown-linux-gnueabihf.tar.xz"
        sha256 "bcfb366456fe129e109dd4c4496dfff6f71bd00e79ffd0c4b77749cac6c8430d"
      else  
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.6/keyweave-aarch64-unknown-linux-gnu.tar.xz"
        sha256 "4bcacaa94cc4350854cec2e1c210f3174d7d42fe4d97a357a0d45c0ac18bbe06"
      end
    else      
      if build.with?("with-gnu-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.6/keyweave-x86_64-unknown-linux-gnu.tar.xz"
        sha256 "d2edcbc3a2c68cee7ac7988155caebe9959d3186dc8be37ce4361733b7de21ef"
      elsif build.with?("with-musl-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.6/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "c02c3e319055dbe0b62724ca51aa5a54581d8dd37c32ed003c4d9e05f249bbee"
      else
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.6/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "c02c3e319055dbe0b62724ca51aa5a54581d8dd37c32ed003c4d9e05f249bbee"
      end
    end
  end

  def install
    bin.install "keyweave"
  end
end
