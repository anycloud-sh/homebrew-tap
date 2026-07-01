class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.39"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.39/anycloud-darwin-arm64.tar.gz"
    sha256 "50a8f661530825ded680f6e1fe033cb7421f8c2d2dc71908a6122235f8133f84"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.39/anycloud-darwin-x64.tar.gz"
    sha256 "4a610f9704a69463ea2665aece6cd3c82f028c64f63183417a2c6961b1a0f30a"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.39/anycloud-linux-arm64.tar.gz"
    sha256 "039854209e706ae72d2fd72bde9665c63abe210249fbde5b014964d348807f3a"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.39/anycloud-linux-x64.tar.gz"
    sha256 "5dd0bc526395708fc4b2acc26c9a15d639f74bcb3df255834afbed6bd35505f5"
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
