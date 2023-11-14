class Keyweave < Formula
  desc "Fetches secrets from Azure Key Vault and weaves them into a convenient .env file"
  homepage "https://github.com/bartvdbraak/keyweave"
  license "GPLv3"
  version "0.2.3"

  option "with-gnu-libc", "Install glibc binary"
  option "with-musl-libc", "Install musl binary (default)"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.3/keyweave-aarch64-apple-darwin.tar.xz"
      sha256 "3622f0a0c92754ad3cb5cd1615f72e8bb7ec47f0c3898aa0316362fc42fa7feb"
    else
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.3/keyweave-x86_64-apple-darwin.tar.xz"
      sha256 "4014ee5cb3e7ca9a6dd015d331bf555e269c18f37a5ba533c77912668d9d3fb8"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.3/keyweave-armv7-unknown-linux-gnueabihf.tar.xz"
        sha256 "d15809d2749d6b696ebb64cea458aa295aae5be4e6df576c130e90cfb9cffafd"
      else  
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.3/keyweave-aarch64-unknown-linux-gnu.tar.xz"
        sha256 "59787654874cf1433e6803ddcd240c663fc4e5e5dd6406459a1a099a01d5785d"
      end
    else      
      if build.with?("with-gnu-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.3/keyweave-x86_64-unknown-linux-gnu.tar.xz"
        sha256 "9457cef031519a894a584ff984734a887191df763a60ddf197c3efb81215fc9e"
      elsif build.with?("with-musl-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.3/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "a1eda38b38aaf7984c421c6b0645bc96559cbf26c060e71579072e44be3fea54"
      else
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.3/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "a1eda38b38aaf7984c421c6b0645bc96559cbf26c060e71579072e44be3fea54"
      end
    end
  end

  def install
    bin.install "keyweave"
  end
end
