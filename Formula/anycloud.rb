class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.34"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.34/anycloud-darwin-arm64.tar.gz"
    sha256 "4810770ce8678537dabd110efb92957057c9559df7780502c93fbbe5546d5d0d"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.34/anycloud-darwin-x64.tar.gz"
    sha256 "09e7938ae4fc89e18774781bee4d7b7a55bb0b435f78392c805620c98e06034b"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.34/anycloud-linux-arm64.tar.gz"
    sha256 "d1e0387d5c17e8467203a3990c0dfb0b21341410dd35b6a90dea825181090b0b"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.34/anycloud-linux-x64.tar.gz"
    sha256 "7ae187ec5314c2bfb14dca6d0c17d199180a6d2030f63d0caeb3fb0bc0cbc6f7"
  end

  def install
    bin.install "anycloud"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/anycloud --version")
  end
end
