class Gospy < Formula
  desc "Non-invasive goroutine inspector for Go processes"
  homepage "https://github.com/monsterxx03/gospy"
  version "v0.8.1"

  if OS.mac?
    if Hardware::CPU.arch == :arm64
      url "https://github.com/monsterxx03/gospy/releases/download/v0.8.1/gospy-darwin-arm64"
      sha256 "0aa11f0e7dbaf311a52e5cc40d7e6b08d0d91d4eaca695efe637c4fc75361083"
    else
      odie "gospy only supports Apple Silicon (arm64) macOS"
    end
  elsif OS.linux?
    if Hardware::CPU.arch == :arm64
      url "https://github.com/monsterxx03/gospy/releases/download/v0.8.1/gospy-linux-arm64"
      sha256 "5629428551a14d7baaa1e336f2347a66de8becefb4ee4f770d9ceed6142b38e6"
    else
      url "https://github.com/monsterxx03/gospy/releases/download/v0.8.1/gospy-linux-amd64"
      sha256 "f90dde045f63a17323c65578708e0d16b57d20a06c0f18289d26565f8150f58e"
    end
  end

  def install
    if OS.mac?
      bin.install "gospy-darwin-arm64" => "gospy"
    else
      bin.install Dir["gospy-linux-*"].first => "gospy"
    end
  end

  test do
    assert_match "Usage", shell_output("#{bin}/gospy --help 2>&1")
  end
end