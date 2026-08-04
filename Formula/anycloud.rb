class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.54"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.54/anycloud-darwin-arm64.tar.gz"
    sha256 "e8fb54cd2e4bc14d4c0b67f6d5422de00c2b4760895826bc273fb7b11cc617ae"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.54/anycloud-darwin-x64.tar.gz"
    sha256 "06d070f1e13154c0d57e3f77d29af3ff990afc91f401270deb942786259cac1e"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.54/anycloud-linux-arm64.tar.gz"
    sha256 "426721e7c41775af282fea5a40e50f3b01290b52e47df45a0793cdceb64d21b9"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.54/anycloud-linux-x64.tar.gz"
    sha256 "f35d8ed58277ff96e594afea159c4dc8b05585e3091b8c3ec5b1eb095c401ee2"
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
