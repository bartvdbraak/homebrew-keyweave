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
      sha256 "57d162579eaa7343aa66eab42ce0032740b8a0593421ee0e4cc6cac582cf427f"
    else
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.2/keyweave-x86_64-apple-darwin.tar.xz"
      sha256 "26eabf9d6b2f7a087002ebf928b2edc4ba436fa29222d3487951e55fb02631a5"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.2/keyweave-armv7-unknown-linux-gnueabihf.tar.xz"
        sha256 "95202bcead216c1e6c16c107031636999800d9f5c41bbff28055bf38b59026bc"
      else  
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.2/keyweave-aarch64-unknown-linux-gnu.tar.xz"
        sha256 "7f3a721bbdc4cb9ef6be2933b225df459dd8cf687f87103416e70e8666533963"
      end
    else      
      if build.with?("with-gnu-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.2/keyweave-x86_64-unknown-linux-gnu.tar.xz"
        sha256 "0bc51e8ec00fcc3d8b7c2d88e3fd3b28419fd79c33360cc9f981d852eb998c16"
      elsif build.with?("with-musl-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.2/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "c4bd7a77a18b1d7cfe113cbc9d972be7ae2f08b00e901e86cbd4f50b2ce7df13"
      else
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.2/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "c4bd7a77a18b1d7cfe113cbc9d972be7ae2f08b00e901e86cbd4f50b2ce7df13"
      end
    end
  end

  def install
    bin.install "keyweave"
  end
end
