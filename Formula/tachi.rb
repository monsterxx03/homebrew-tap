class Tachi < Formula
  desc "Your intelligent terminal AI agent"
  homepage "https://github.com/monsterxx03/tachi"
  version "v1.1.0"

  if OS.mac?
    if Hardware::CPU.arch == :arm64
      url "https://github.com/monsterxx03/tachi/releases/download/v1.1.0/tachi-darwin-arm64"
      sha256 "a6187d0942f14de348d897fcc0fca22f87b86bf98ca89fc7fa03b50eaf14a69d"
    else
      url "https://github.com/monsterxx03/tachi/releases/download/v1.1.0/tachi-darwin-amd64"
      sha256 "1d49a99074ec697c3d6970b0ad1869c7e8076520cc90b6bfa263fc503258db5d"
    end
  elsif OS.linux?
    if Hardware::CPU.arch == :arm64
      url "https://github.com/monsterxx03/tachi/releases/download/v1.1.0/tachi-linux-arm64"
      sha256 "113b06709ea01795ba93944a117ccf27cc79aff2677e298ff6be7e21ee4460b1"
    else
      url "https://github.com/monsterxx03/tachi/releases/download/v1.1.0/tachi-linux-amd64"
      sha256 "cf8e25f782eaaaa6949029c51e5d5f45abb3eea6505c939c56afab7da7a5f064"
    end
  end

  def install
    if OS.mac?
      bin.install Dir["tachi-darwin-*"].first => "tachi"
    else
      bin.install Dir["tachi-linux-*"].first => "tachi"
    end
  end

  test do
    assert_match "tachi", shell_output("#{bin}/tachi --version")
  end
end
