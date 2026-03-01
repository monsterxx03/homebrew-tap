class Linko < Formula
  desc "A CLI tool for something"
  homepage "https://github.com/monsterxx03/linko"
  version "v0.4.0"

  if Hardware::CPU.arch == :arm64
    url "https://github.com/monsterxx03/linko/releases/download/v0.4.0/linko-darwin-arm64"
    sha256 "a19dae807d43f25705821c3ca24e1f52215832e69227e561ef442441fd24672d"
  else
    url "https://github.com/monsterxx03/linko/releases/download/v0.4.0/linko-darwin-amd64"
    sha256 "74dcba172df29bbd981f73a664a0c45d861754ad2454b73699ab44c1b21fda22"
  end

  def install
    arch = Hardware::CPU.arch == :arm64 ? "arm64" : "amd64"
    bin.install "linko-darwin-#{arch}" => "linko"
  end

  test do
    assert_match "linko", shell_output("#{bin}/linko --version")
  end
end
