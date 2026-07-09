class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.45"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.45/anycloud-darwin-arm64.tar.gz"
    sha256 "347cd6a95fc1d0a9c89ea454b8ddd6ec0c6b8c4712b2df597263d476f066683e"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.45/anycloud-darwin-x64.tar.gz"
    sha256 "82ae7e40db3c752d2668823cbe3442d8686590902d64e4f40ae99bbc9d0dfc31"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.45/anycloud-linux-arm64.tar.gz"
    sha256 "41879193ac79d9fe6a3397189794081acae236e76d904247fd395246bdcc4404"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.45/anycloud-linux-x64.tar.gz"
    sha256 "ce35cec2a709e7d7c8d0d56aaf1023eb367d41412c3bc6604e44d54b509721bf"
  end

  def install
    bin.install "anycloud"
  end

  def caveats
    <<~EOS
      If a local API server is running, run:
        anycloud upgrade
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/anycloud --version")
  end
end
