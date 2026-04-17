class Root < Formula
  desc "Knowledge compiler for AI agents — parse, extract, link, compile, verify, serve"
  homepage "https://github.com/DevbyNaveen/thinkingroot"
  version "0.9.0"

  on_macos do
    on_arm do
      url "https://github.com/DevbyNaveen/releases/releases/download/v0.9.0/root-macos-arm64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/DevbyNaveen/releases/releases/download/v0.9.0/root-macos-amd64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "root-macos-arm64" => "root" if Hardware::CPU.arm?
    bin.install "root-macos-amd64" => "root" if Hardware::CPU.intel?
  end

  test do
    assert_match "root", shell_output("#{bin}/root --version 2>&1", 0)
  end
end
