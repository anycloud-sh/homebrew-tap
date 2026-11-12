class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.76"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.76/anycloud-darwin-arm64.tar.gz"
    sha256 "c4ca6b218b247cadf0e3714f9ddbf874deacace0ec5f06af507c41a11d8b2ea3"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.76/anycloud-darwin-x64.tar.gz"
    sha256 "b7adf46190d9f2384e979c8f9f7c8316b3fcbd41337c2b132f4a36069eba5738"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.76/anycloud-linux-arm64.tar.gz"
    sha256 "1a872105c95eebc846328a0f590e6b82fc20961356775827075ef0e5dcc29e68"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.76/anycloud-linux-x64.tar.gz"
    sha256 "daec3bdf07d3d66a35446585a3a57fb842e3b8748ffbca3013fbdbff46081412"
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
