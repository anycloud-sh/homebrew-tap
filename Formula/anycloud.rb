class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.52"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.52/anycloud-darwin-arm64.tar.gz"
    sha256 "d1449e54e45135fac02c74f2c112eace1d5877337bee5cb771a9d8261f85e522"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.52/anycloud-darwin-x64.tar.gz"
    sha256 "19d7df50fdce3c3a1ace56a325bbfefe0377553c124e0be49c6a24350dea1282"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.52/anycloud-linux-arm64.tar.gz"
    sha256 "17a29d230611ee46283e043d833b9a088be54b69fd134c673e5734f01317e02b"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.52/anycloud-linux-x64.tar.gz"
    sha256 "c6b64e5bdcba943a2ea4e555fa82359cafb73665cec2b17b6d6d2969ff95d162"
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
