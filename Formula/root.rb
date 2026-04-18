class Root < Formula
  desc "Knowledge compiler for AI agents — parse, extract, link, compile, verify, serve"
  homepage "https://github.com/DevbyNaveen/ThinkingRoot"
  version "0.9.1"

  on_macos do
    on_arm do
      url "https://github.com/DevbyNaveen/releases/releases/download/v0.9.1/root-macos-arm64"
      sha256 "c0592dbdb67a99b55cef1d266e4131c4ce9d60fce4b2d6ec135b02dbb3b8b8f5"
    end
    on_intel do
      url "https://github.com/DevbyNaveen/releases/releases/download/v0.9.1/root-macos-amd64.tar.gz"
      sha256 "e3ff2eadd7d6fb2957be383f9707ad81534ffa43979f2fdbc7efe8f790f42c91"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "root-macos-arm64" => "root"
    else
      lib.install "libonnxruntime.1.23.2.dylib"
      lib.install_symlink "libonnxruntime.1.23.2.dylib" => "libonnxruntime.dylib"
      # Add lib/ rpath so the binary finds the ORT dylib via Homebrew's lib dir.
      system "install_name_tool", "-add_rpath", lib.to_s, "root"
      bin.install "root"
    end
  end

  test do
    assert_match "root", shell_output("#{bin}/root --version 2>&1", 0)
  end
end
