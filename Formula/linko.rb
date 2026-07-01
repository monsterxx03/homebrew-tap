class Linko < Formula
  desc "A CLI tool for something"
  homepage "https://github.com/monsterxx03/linko"
  version "v0.5.6"

  if Hardware::CPU.arch == :arm64
    url "https://github.com/monsterxx03/linko/releases/download/v0.5.6/linko-darwin-arm64"
    sha256 "066574843faf25f9accc99002442cd58874cff591465c12e41fe536d5091c305"
  else
    url "https://github.com/monsterxx03/linko/releases/download/v0.5.6/linko-darwin-amd64"
    sha256 "bb5b40d23fc496491338cddb112b269052bd9ba24f17f3f3df5ff269fce30842"
  end

  def install
    arch = Hardware::CPU.arch == :arm64 ? "arm64" : "amd64"
    bin.install "linko-darwin-#{arch}" => "linko"
  end

  test do
    assert_match "linko", shell_output("#{bin}/linko --version")
  end
end
