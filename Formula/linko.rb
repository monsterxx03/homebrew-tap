class Linko < Formula
  desc "A CLI tool for something"
  homepage "https://github.com/monsterxx03/linko"
  version "v0.5.4"

  if Hardware::CPU.arch == :arm64
    url "https://github.com/monsterxx03/linko/releases/download/v0.5.4/linko-darwin-arm64"
    sha256 "1e1bff40aa6099cd663c25d770b01ad2e945454c8ce29ee72d134be53cb239c7"
  else
    url "https://github.com/monsterxx03/linko/releases/download/v0.5.4/linko-darwin-amd64"
    sha256 "9ad173750d98318add2f0997c8c61ef203cef908cd349f09c8344035eee5a78e"
  end

  def install
    arch = Hardware::CPU.arch == :arm64 ? "arm64" : "amd64"
    bin.install "linko-darwin-#{arch}" => "linko"
  end

  test do
    assert_match "linko", shell_output("#{bin}/linko --version")
  end
end
