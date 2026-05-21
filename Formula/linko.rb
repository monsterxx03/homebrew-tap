class Linko < Formula
  desc "A CLI tool for something"
  homepage "https://github.com/monsterxx03/linko"
  version "v0.5.3"

  if Hardware::CPU.arch == :arm64
    url "https://github.com/monsterxx03/linko/releases/download/v0.5.3/linko-darwin-arm64"
    sha256 "66343b8cd6a5014681f9e82d9b3a1827d05f44fcb0ed58d6cd3f2fc15a202e68"
  else
    url "https://github.com/monsterxx03/linko/releases/download/v0.5.3/linko-darwin-amd64"
    sha256 "088f21449326afbc1c031b4a61f768e3d24d6127ba91a22c6048806dd70020ed"
  end

  def install
    arch = Hardware::CPU.arch == :arm64 ? "arm64" : "amd64"
    bin.install "linko-darwin-#{arch}" => "linko"
  end

  test do
    assert_match "linko", shell_output("#{bin}/linko --version")
  end
end
