class Tachi < Formula
  desc "Your intelligent terminal AI agent"
  homepage "https://github.com/monsterxx03/tachi"
  version "v1.2.0"

  if OS.mac?
    if Hardware::CPU.arch == :arm64
      url "https://github.com/monsterxx03/tachi/releases/download/v1.2.0/tachi-darwin-arm64"
      sha256 "30c58e5f85a6a5c0c0c3ba7d10119fd46cce17d8179491d9245bd50d8621216d"
    else
      url "https://github.com/monsterxx03/tachi/releases/download/v1.2.0/tachi-darwin-amd64"
      sha256 "bccaa49811c54c956dfc3a6bdc5c385c1d8c2f247e1a40973249043ee3db5a19"
    end
  elsif OS.linux?
    if Hardware::CPU.arch == :arm64
      url "https://github.com/monsterxx03/tachi/releases/download/v1.2.0/tachi-linux-arm64"
      sha256 "683a4aa32d6d5c4c25ba17f91b7193d2a41467a1c5e96202549488e7c36454a0"
    else
      url "https://github.com/monsterxx03/tachi/releases/download/v1.2.0/tachi-linux-amd64"
      sha256 "bf5c88002099890fa79f4dcadb34808dc5077648d42551f217a3fd782a22d0e7"
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
