class Linko < Formula
  desc "A CLI tool for something"
  homepage "https://github.com/monsterxx03/linko"
  version "v0.5.2"

  if Hardware::CPU.arch == :arm64
    url "https://github.com/monsterxx03/linko/releases/download/v0.5.2/linko-darwin-arm64"
    sha256 "dc12590e6c6ec170b6fd4155abf96f45feeb77035d8096c101e7165a3ba7c2af"
  else
    url "https://github.com/monsterxx03/linko/releases/download/v0.5.2/linko-darwin-amd64"
    sha256 "7978795c44daf3ed4d49de44a18d564666e4ff9519c1db44915761f84c04fec5"
  end

  def install
    arch = Hardware::CPU.arch == :arm64 ? "arm64" : "amd64"
    bin.install "linko-darwin-#{arch}" => "linko"
  end

  test do
    assert_match "linko", shell_output("#{bin}/linko --version")
  end
end
