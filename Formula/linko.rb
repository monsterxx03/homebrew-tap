class Linko < Formula
  desc "A CLI tool for something"
  homepage "https://github.com/monsterxx03/linko"
  version "v0.2.1"

  if Hardware::CPU.arch == :arm64
    url "https://github.com/monsterxx03/linko/releases/download/v0.2.1/linko-darwin-arm64"
    sha256 "7a32272235b36c4d78116b23f9d8f45a4449d05af0a14ce1f4455b42d7a000f1"
  else
    url "https://github.com/monsterxx03/linko/releases/download/v0.2.1/linko-darwin-amd64"
    sha256 "01872edccb005dba9de968b768aa0c75cc8a0b46c1aad3e79bc351b749d26778"
  end

  def install
    arch = Hardware::CPU.arch == :arm64 ? "arm64" : "amd64"
    bin.install "linko-darwin-#{arch}" => "linko"
  end

  test do
    assert_match "linko", shell_output("#{bin}/linko --version")
  end
end
