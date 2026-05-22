class Tachi < Formula
  desc "Your intelligent terminal AI agent"
  homepage "https://github.com/monsterxx03/tachi"
  version "v1.0.0"

  if OS.mac?
    if Hardware::CPU.arch == :arm64
      url "https://github.com/monsterxx03/tachi/releases/download/v1.0.0/tachi-darwin-arm64"
      sha256 "ac4e9ec1db5c51eb35b9b30a42d6381e048f5cbae260cc2c77abadc9c4ed2b9f"
    else
      url "https://github.com/monsterxx03/tachi/releases/download/v1.0.0/tachi-darwin-amd64"
      sha256 "72ebf6ff949195ea166fb1fac113426e6062d4c7c9091b98b61bb66a280b9b58"
    end
  elsif OS.linux?
    if Hardware::CPU.arch == :arm64
      url "https://github.com/monsterxx03/tachi/releases/download/v1.0.0/tachi-linux-arm64"
      sha256 "6881d890d5e0fec6b69968f8782d3a9dfa3f8e1363bebfd6cefdfec30ecd3169"
    else
      url "https://github.com/monsterxx03/tachi/releases/download/v1.0.0/tachi-linux-amd64"
      sha256 "403d0fadead78f6dd03d5b4b910c21cc7f9b30318193dd5e8f1de9861e9a7c61"
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
