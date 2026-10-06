class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.66"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.66/anycloud-darwin-arm64.tar.gz"
    sha256 "8c46466efeb51421a50b2bb2fad40b431e0df15035b901dbaa15ffaa9b641906"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.66/anycloud-darwin-x64.tar.gz"
    sha256 "52e4689bf5007527c888915da19600e8ef16c352b9e594a980660df988ca4ba1"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.66/anycloud-linux-arm64.tar.gz"
    sha256 "3da64854d38d5b746a380c793ec24014cda9e591671265440a60e6194aaac2d1"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.66/anycloud-linux-x64.tar.gz"
    sha256 "243e184b744613cd58db5e634f23fbe655de6f6afbe2aa02d91312b88a5c1901"
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
