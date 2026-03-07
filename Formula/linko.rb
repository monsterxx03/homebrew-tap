class Linko < Formula
  desc "A CLI tool for something"
  homepage "https://github.com/monsterxx03/linko"
  version "v0.5.0"

  if Hardware::CPU.arch == :arm64
    url "https://github.com/monsterxx03/linko/releases/download/v0.5.0/linko-darwin-arm64"
    sha256 "35f70a8449cdceee5d2cb893c68836b5179428fe725bd7612f401b3ed6da4efe"
  else
    url "https://github.com/monsterxx03/linko/releases/download/v0.5.0/linko-darwin-amd64"
    sha256 "2b6fa77f49f95937f7e9de828000eb87eb775bcdd635084b768b8ad09411dc9c"
  end

  def install
    arch = Hardware::CPU.arch == :arm64 ? "arm64" : "amd64"
    bin.install "linko-darwin-#{arch}" => "linko"
  end

  test do
    assert_match "linko", shell_output("#{bin}/linko --version")
  end
end
