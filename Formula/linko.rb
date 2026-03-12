class Linko < Formula
  desc "A CLI tool for something"
  homepage "https://github.com/monsterxx03/linko"
  version "v0.5.1"

  if Hardware::CPU.arch == :arm64
    url "https://github.com/monsterxx03/linko/releases/download/v0.5.1/linko-darwin-arm64"
    sha256 "26aaacb0e67e1e4aa2765714a57ddbda58880ac5f39889a65f99714693bc7c18"
  else
    url "https://github.com/monsterxx03/linko/releases/download/v0.5.1/linko-darwin-amd64"
    sha256 "8d727c7f43e57429db1bd9b584b5f33149d819e16b5af21d5d434392e3041dde"
  end

  def install
    arch = Hardware::CPU.arch == :arm64 ? "arm64" : "amd64"
    bin.install "linko-darwin-#{arch}" => "linko"
  end

  test do
    assert_match "linko", shell_output("#{bin}/linko --version")
  end
end
