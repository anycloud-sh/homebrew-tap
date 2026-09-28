class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.65"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.65/anycloud-darwin-arm64.tar.gz"
    sha256 "0d26d2c1cd26da98d70911445a988898513c3c9a623fd54f7e89f6304c62c5d6"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.65/anycloud-darwin-x64.tar.gz"
    sha256 "7cba19b3ceed5cd4db8c329c51b93d341d3f8a5b85900beb24f2bdda4d63ea87"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.65/anycloud-linux-arm64.tar.gz"
    sha256 "c0bcf15e3cfbb57773d5fd6ebce546dd5e8492a34ce0d32e90791c8dd8f9ff96"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.65/anycloud-linux-x64.tar.gz"
    sha256 "3678a688c2123dcf5d663bfbf5db64c1839029aedbecb8f67b740471deaac15e"
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
