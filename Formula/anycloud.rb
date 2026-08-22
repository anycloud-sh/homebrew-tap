class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.61"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.61/anycloud-darwin-arm64.tar.gz"
    sha256 "db8685af6f7a0e8adffdad1737b261ff258df7a8c0a3a952553b2c65b89c2d77"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.61/anycloud-darwin-x64.tar.gz"
    sha256 "cf45219c7f23bc529cf5399c8ae05a9f50bee679e42e08616fcb0eb0d2cd0ac5"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.61/anycloud-linux-arm64.tar.gz"
    sha256 "9f8d810719e7d7773f64c2e9ddf18803a8c990bea70ebd290c054eead3246520"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.61/anycloud-linux-x64.tar.gz"
    sha256 "e40963982a38291b6e7a6dffa2e63edf1887223409cadd9ed432c15c6c82466b"
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
