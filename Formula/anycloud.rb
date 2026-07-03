class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.41"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.41/anycloud-darwin-arm64.tar.gz"
    sha256 "5208cbeaf93d96d5dfd6cabd780579831fdefa8f9daea77e095181d19577f543"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.41/anycloud-darwin-x64.tar.gz"
    sha256 "6d8427a3b728b7da383464d3ad32f76db5ba62b7098026bffb200e117582f86c"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.41/anycloud-linux-arm64.tar.gz"
    sha256 "be39c0c9708c769c8b71dbc00d62eee5aeee3f40dd32604f2dd8c383ab2d3564"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.41/anycloud-linux-x64.tar.gz"
    sha256 "1f01f7d1486304d2c7696743fb8dde60a0c3526511f7beaeed7fed9f2ca2422a"
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
