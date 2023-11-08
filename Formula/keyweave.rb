class Keyweave < Formula
  desc "Fetches secrets from Azure Key Vault and weaves them into a convenient .env file"
  homepage "https://github.com/bartvdbraak/keyweave"
  license "GPLv3"
  version "0.2.0"

  option "with-gnu-libc", "Install glibc binary"
  option "with-musl-libc", "Install musl binary (default)"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.0/keyweave-aarch64-apple-darwin.tar.xz"
      sha256 "5d486e110fed077ff9309814cc4bb205b50fa4263bad3d204e4d9f230002dd3c"
    else
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.0/keyweave-x86_64-apple-darwin.tar.xz"
      sha256 "d88f646619d69f088fb2a1c223c7b1cf6199659fd593abc475851ddee866d4e9"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.0/keyweave-armv7-unknown-linux-gnueabihf.tar.xz"
        sha256 "45863c6d3f34bb7727cd112a0adfc20b840f4f5c92def99b9e15bde20e2a32f8"
      else  
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.0/keyweave-aarch64-unknown-linux-gnu.tar.xz"
        sha256 "da415340276b6bc8f700e54cafdef23445973dba0d126065cf73135dff2c922d"
      end
    else      
      if build.with?("with-gnu-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.0/keyweave-x86_64-unknown-linux-gnu.tar.xz"
        sha256 "79317c194bd41a2d9ec55e80353e3eb510a11e3c57708e65cc0a34966a86ae14"
      elsif build.with?("with-musl-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.0/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "6f6ad0810a4bf75d914dd09c4c55efadc8b038d10811c4223b787ac5d1cf4186"
      else
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.0/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "6f6ad0810a4bf75d914dd09c4c55efadc8b038d10811c4223b787ac5d1cf4186"
      end
    end
  end

  def install
    bin.install "keyweave"
  end
end
