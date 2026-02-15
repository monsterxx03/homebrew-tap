class Linko < Formula
  desc "A CLI tool for something"
  homepage "https://github.com/monsterxx03/linko"
  version "v0.2.0"

  if Hardware::CPU.arch == :arm64
    url "https://github.com/monsterxx03/linko/releases/download/v0.2.0/linko-darwin-arm64"
    sha256 "bcab428f42b20938d09800aa5bf61a90062e48f563ab0ea38d6a912d8bb7a080"
  else
    url "https://github.com/monsterxx03/linko/releases/download/v0.2.0/linko-darwin-amd64"
    sha256 "afd5f34d78e2f9241370a5ca16bc175de00e71bb3382190824bc7696743849c8"
  end

  bottle :unneeded

  def install
    bin.install "linko-darwin-#{Hardware::CPU.arch == :arm64 ? "arm64" : "amd64"}" => "linko"
  end

  test do
    assert_match "linko", shell_output("#{bin}/linko --version")
  end
end
