class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.30"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.30/anycloud-darwin-arm64.tar.gz"
    sha256 "23f1d3b98f79aea351f29324ae343e0d853fafbefce652e63dccbd4d35c46609"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.30/anycloud-darwin-x64.tar.gz"
    sha256 "f9696424b6df46423bea5eb4e90ee81866e908cbee40442a9f0e089849702a17"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.30/anycloud-linux-arm64.tar.gz"
    sha256 "4a365e34731c519d008c3c58c2290686624e851d606864820bd787912cd9f661"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.30/anycloud-linux-x64.tar.gz"
    sha256 "96837ce7188f8d3e3831e7e94f626fe7e18be4fcd16ccde4cdad7571dda09fb2"
  end

  def install
    bin.install "anycloud"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/anycloud --version")
  end
end
