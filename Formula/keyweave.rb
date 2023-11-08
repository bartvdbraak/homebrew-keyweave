# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Keyweave < Formula
  desc "Fetches secrets from Azure Key Vault and weaves them into a convenient .env file"
  homepage "https://github.com/bartvdbraak/keyweave"
  url "https://github.com/bartvdbraak/keyweave/releases/download/v0.2.0/keyweave-x86_64-apple-darwin.tar.xz"
  sha256 "d88f646619d69f088fb2a1c223c7b1cf6199659fd593abc475851ddee866d4e9"
  version "0.2.0"

  def install
    bin.install "keyweave"
  end
end