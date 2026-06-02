class Linko < Formula
  desc "A CLI tool for something"
  homepage "https://github.com/monsterxx03/linko"
  version "v0.5.5"

  if Hardware::CPU.arch == :arm64
    url "https://github.com/monsterxx03/linko/releases/download/v0.5.5/linko-darwin-arm64"
    sha256 "ee64dea479e5022794c22a09f9d8b77dbf74f5740262fb6f6f31291473660732"
  else
    url "https://github.com/monsterxx03/linko/releases/download/v0.5.5/linko-darwin-amd64"
    sha256 "0188a0d6a0a0e8c3aa65c115267d781800184dc10ea03de1100932ab763aa687"
  end

  def install
    arch = Hardware::CPU.arch == :arm64 ? "arm64" : "amd64"
    bin.install "linko-darwin-#{arch}" => "linko"
  end

  test do
    assert_match "linko", shell_output("#{bin}/linko --version")
  end
end
