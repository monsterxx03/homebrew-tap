class Linko < Formula
  desc "High-performance transparent proxy server with DNS shunting"
  homepage "https://github.com/monsterxx03/linko"
  
  # 直接从 GitHub Release 下载预编译的 arm64 二进制
  url "https://github.com/monsterxx03/linko/releases/download/v0.1.0/linko"
  version "0.1.0"
  sha256 "binary"
  license "MIT"

  def install
    bin.install "linko"
    etc.install "config/linko.yaml" => "linko.yaml"
  end

  test do
    assert_match "linko", shell_output("#{bin}/linko --help")
  end
end
