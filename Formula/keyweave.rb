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
      sha256 "a880adaa757120fd42a1f13796946610f1fe381b58e7e26c71e2dca53b8b5471"
    else
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.4/keyweave-x86_64-apple-darwin.tar.xz"
      sha256 "090570cc80840d6aa75fd5b7d8d3db07e7dcbae5eb87e4cc056731583950eafb"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.4/keyweave-armv7-unknown-linux-gnueabihf.tar.xz"
        sha256 "9e85a8be920f28f917f4927aa5fa9632ceda5c92de2a35ce6faad66768ce0cde"
      else  
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.4/keyweave-aarch64-unknown-linux-gnu.tar.xz"
        sha256 "5f436bd444b98a593cd14c37b12647d45c58610959fc8ea7c8e6d7fac70f6660"
      end
    else      
      if build.with?("with-gnu-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.4/keyweave-x86_64-unknown-linux-gnu.tar.xz"
        sha256 "75db375f3beb890125b60da042c6c29263515227b513b9adec270eeffe4241c5"
      elsif build.with?("with-musl-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.4/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "15d46f0755cbcb5e79cb3fa6a8eae4978afddf5981bf3ed11fea6f29b122d5a9"
      else
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.4/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "15d46f0755cbcb5e79cb3fa6a8eae4978afddf5981bf3ed11fea6f29b122d5a9"
      end
    end
  end

  def install
    bin.install "keyweave"
  end
end
