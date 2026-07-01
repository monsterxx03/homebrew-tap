class Tachi < Formula
  desc "Your intelligent terminal AI agent"
  homepage "https://github.com/monsterxx03/tachi"
  version "v1.3.0"

  if OS.mac?
    if Hardware::CPU.arch == :arm64
      url "https://github.com/monsterxx03/tachi/releases/download/v1.3.0/tachi-darwin-arm64"
      sha256 "101148c853b721a503c3c76a7f365a40c71b45d8130ec5cb7e7d229e5522a745"
    else
      url "https://github.com/monsterxx03/tachi/releases/download/v1.3.0/tachi-darwin-amd64"
      sha256 "f4b61f2b71d553e296ec5d71026656c5c737e42e81354d095849ab7df391118a"
    end
  elsif OS.linux?
    if Hardware::CPU.arch == :arm64
      url "https://github.com/monsterxx03/tachi/releases/download/v1.3.0/tachi-linux-arm64"
      sha256 "f45ee54f41b8a64b4e1a8aca3fbbb55a06d6178a950efc897a3021481470d30c"
    else
      url "https://github.com/monsterxx03/tachi/releases/download/v1.3.0/tachi-linux-amd64"
      sha256 "f25a2c63a15e5f26d98cd19da930d208f04d1bc583a0d5e265ab2b1300849a1c"
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
