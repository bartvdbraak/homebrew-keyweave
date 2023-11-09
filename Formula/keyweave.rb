class Keyweave < Formula
  desc "Fetches secrets from Azure Key Vault and weaves them into a convenient .env file"
  homepage "https://github.com/bartvdbraak/keyweave"
  license "GPLv3"
  version "v0.2.1"

  option "with-gnu-libc", "Install glibc binary"
  option "with-musl-libc", "Install musl binary (default)"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bartvdbraak/keyweave/releases/download/vv0.2.1/keyweave-aarch64-apple-darwin.tar.xz"
      sha256 "2797f246f4551e825fa27c3d373a8462300bec6bc9c85db790150428c845f1c6"
    else
      url "https://github.com/bartvdbraak/keyweave/releases/download/vv0.2.1/keyweave-x86_64-apple-darwin.tar.xz"
      sha256 "3bee0c6ade49af5b86d1b7bdcdaa2d2c2388e8c3a58089bafb4fbda4efdb87b8"
    end
  elif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/bartvdbraak/keyweave/releases/download/vv0.2.1/keyweave-armv7-unknown-linux-gnueabihf.tar.xz"
        sha256 "e3fa0c462c89b5e34a01f3d9f2303913e25b1f9bd904c4cdddcd18a930942197"
      else  
        url "https://github.com/bartvdbraak/keyweave/releases/download/vv0.2.1/keyweave-aarch64-unknown-linux-gnu.tar.xz"
        sha256 "708aa03fb55677f4c735a12db2e1d750fe2ba76452481a66fd91fbff19943313"
      end
    else      
      if build.with?("with-gnu-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/vv0.2.1/keyweave-x86_64-unknown-linux-gnu.tar.xz"
        sha256 "b25c017383f3118837d10d453565d0be1f61c5ca594bcff6d34edbd7c68ba61e"
      elsif build.with?("with-musl-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/vv0.2.1/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "16480a4692618b8b272a50384331672015468b9e25103926d6cbc0a9b2d15e77"
      else
        url "https://github.com/bartvdbraak/keyweave/releases/download/vv0.2.1/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "16480a4692618b8b272a50384331672015468b9e25103926d6cbc0a9b2d15e77"
      end
    end
  end

  def install
    bin.install "keyweave"
  end
end
