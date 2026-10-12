class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.70"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.70/anycloud-darwin-arm64.tar.gz"
    sha256 "efce6f6faa5d46b04cb45c5565a888a90d95ba53ac6c6f8685134dff2af63dad"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.70/anycloud-darwin-x64.tar.gz"
    sha256 "8246f3bf90e6ccb0fb96ce09cc9cc5d36ba2d7f5ebb21b232bebb36e6ca474c8"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.70/anycloud-linux-arm64.tar.gz"
    sha256 "11a18b056625fa6157e6f1d6c9399d963670598c05a4da24b0d8ee4e84585997"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.70/anycloud-linux-x64.tar.gz"
    sha256 "a4bee92010c0b70bc0001e04d9511fda01856ef6e83dff2795ce030a237865f1"
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
