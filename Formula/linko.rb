class Linko < Formula
  desc "High-performance transparent proxy server with DNS shunting"
  homepage "https://github.com/monsterxx03/linko"
  
  # 直接从 GitHub Release 下载预编译的 arm64 二进制
  url "https://github.com/monsterxx03/linko/releases/download/v0.1.1/linko"
  version "0.1.1"
  sha256 :no_check
  license "MIT"

  def install
    bin.install "linko"
    (etc/"linko.yaml").write default_config
  end

  def default_config
    <<~YAML
      server:
          listen_addr: 127.0.0.1:9890
          log_level: info
      dns:
          listen_addr: 127.0.0.1:6363
          domestic_dns:
              - 223.5.5.5
              - 114.114.114.114
          foreign_dns:
              - 8.8.8.8
              - 1.1.1.1
          cache_ttl: 5m0s
          tcp_for_foreign: true
      traffic:
          enable_realtime: true
          enable_history: true
          update_interval: 1s
          db_path: data/traffic.db
      firewall:
          enable_auto: true
          redirect_dns: true
          redirect_http: true
          redirect_https: true
      upstream:
          enable: true
          type: socks5
          addr: 127.0.0.1:7891
          username: ""
          password: ""
      admin:
          enable: true
          listen_addr: 0.0.0.0:9810
    YAML
  end

  test do
    assert_match "linko", shell_output("#{bin}/linko --help")
  end
end
