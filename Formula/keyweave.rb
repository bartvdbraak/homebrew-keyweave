class Keyweave < Formula
  desc "Fetches secrets from Azure Key Vault and weaves them into a convenient .env file"
  homepage "https://github.com/bartvdbraak/keyweave"
  license "GPLv3"
  version "0.2.7"

  option "with-gnu-libc", "Install glibc binary"
  option "with-musl-libc", "Install musl binary (default)"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.7/keyweave-aarch64-apple-darwin.tar.xz"
      sha256 "b4b8ae636742d4531326c9d58311b1843e99b38d0a1014ae8683a5a6d1c9b227"
    else
      url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.7/keyweave-x86_64-apple-darwin.tar.xz"
      sha256 "e9c69dbcae9e27818aee2595e87bee81bd5ce7918f2b3822164b3fce4388868e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.7/keyweave-armv7-unknown-linux-gnueabihf.tar.xz"
        sha256 "879873e0eb15b4b20a320a867d6db94690b3fd8eea9e4b1dbef52ae2179ab064"
      else  
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.7/keyweave-aarch64-unknown-linux-gnu.tar.xz"
        sha256 "aac4f7963398e15bee38d6a9fae8bcfdd79fec4caaac9dafb9dab2fe6d1a88a2"
      end
    else      
      if build.with?("with-gnu-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.7/keyweave-x86_64-unknown-linux-gnu.tar.xz"
        sha256 "998a0f2a2f6a329177b7034aa87211b6d6957f2882caedd718fce0426fa4468b"
      elsif build.with?("with-musl-libc")
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.7/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "484da22d220b021f24dfade5f4485f010a23b519f9ba9997318d76b2395741ed"
      else
        url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.7/keyweave-x86_64-unknown-linux-musl.tar.xz"
        sha256 "484da22d220b021f24dfade5f4485f010a23b519f9ba9997318d76b2395741ed"
      end
    end
  end

  def install
    bin.install "keyweave"
  end
end
