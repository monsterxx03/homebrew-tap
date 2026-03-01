class Linko < Formula
  desc "A CLI tool for something"
  homepage "https://github.com/monsterxx03/linko"
  version "v0.3.0"

  if Hardware::CPU.arch == :arm64
    url "https://github.com/monsterxx03/linko/releases/download/v0.3.0/linko-darwin-arm64"
    sha256 "65883e7508bc9b66e9c434f34aac40c95bef0fcb669226eba86551b3d91a638b"
  else
    url "https://github.com/monsterxx03/linko/releases/download/v0.3.0/linko-darwin-amd64"
    sha256 "3c2a8dd19e68faa3c8310c64411c4c97b09838d18fb3bf0cd6c503c0a66df450"
  end

  def install
    arch = Hardware::CPU.arch == :arm64 ? "arm64" : "amd64"
    bin.install "linko-darwin-#{arch}" => "linko"
  end

  test do
    assert_match "linko", shell_output("#{bin}/linko --version")
  end
end
