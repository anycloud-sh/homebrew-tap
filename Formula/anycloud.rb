class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.75"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.75/anycloud-darwin-arm64.tar.gz"
    sha256 "2561341e467db3cfa9077a62d296377c3d98656370d7ab1bb6d959a90e8602e5"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.75/anycloud-darwin-x64.tar.gz"
    sha256 "f9740606463d198779145518ee86210bfd47c0ecc8b22fc65c3f6e8e9bd09553"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.75/anycloud-linux-arm64.tar.gz"
    sha256 "bef94e0a545a4f36554410a16d87f5eb70e5e95ef6f18fb1686fe7aa8c6066c1"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.75/anycloud-linux-x64.tar.gz"
    sha256 "5a48641b0cbcdd6d9545b6ace7459e5e1cbfa62e6dc51d1572fd4e537928dea4"
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
