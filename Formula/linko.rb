class Linko < Formula
  desc "A CLI tool for something"
  homepage "https://github.com/monsterxx03/linko"
  version "v0.6.0"

  on_macos do
    if Hardware::CPU.arch == :arm64
      url "https://github.com/monsterxx03/linko/releases/download/v0.6.0/linko-darwin-arm64"
      sha256 "3f4c00bd510f42cd57d80e547b199b78a9b9f5e92845ba318bbca6757541debc"
    else
      url "https://github.com/monsterxx03/linko/releases/download/v0.6.0/linko-darwin-amd64"
      sha256 "e4ece6476c7b1ac655104596c2bd8a5ff30093e557e683506a834f7128a59785"
    end
  end

  on_linux do
    if Hardware::CPU.arch == :arm64
      url "https://github.com/monsterxx03/linko/releases/download/v0.6.0/linko-linux-arm64"
      sha256 "1154c0847ddb896d6400fb4fa54b8782976538f6e94b816389274c8f805157e2"
    else
      url "https://github.com/monsterxx03/linko/releases/download/v0.6.0/linko-linux-amd64"
      sha256 "4a71212d998ed12b326ae348e5d127779af86221199a4a78a1c72961efc74ec0"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arch == :arm64 ? "arm64" : "amd64"
    bin.install "linko-#{os}-#{arch}" => "linko"
  end

  test do
    assert_match "linko", shell_output("#{bin}/linko --version")
  end
end
