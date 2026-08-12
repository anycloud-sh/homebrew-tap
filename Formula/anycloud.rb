class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.56"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.56/anycloud-darwin-arm64.tar.gz"
    sha256 "eebd33b8a97bcbff90b8fd7f529b0785a2a2bd36903ee0571d054606cf15b655"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.56/anycloud-darwin-x64.tar.gz"
    sha256 "ef78cd999b0ae64ab8e44a956b0a2e399819ccaa9b312bea5244ce4ceccf4a9f"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.56/anycloud-linux-arm64.tar.gz"
    sha256 "fc9b8703516c3ccccae551a17d2e3b31e25c43f6de5616b1894d117f6f7aacb1"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.56/anycloud-linux-x64.tar.gz"
    sha256 "518b673efe4ed394d53a21b6db794924fbbf444ea0496f737fc6ab681e1d60ee"
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
