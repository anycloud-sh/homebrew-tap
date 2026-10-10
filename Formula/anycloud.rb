class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.68"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.68/anycloud-darwin-arm64.tar.gz"
    sha256 "439638c3a1ceca96092e7f66bb1154dfa1d34a69ff6ac8bd607d2092c1163bac"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.68/anycloud-darwin-x64.tar.gz"
    sha256 "4f17f60546e3f06d670a76d63391de62ee029a95b76b280848de07c7b5b6f719"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.68/anycloud-linux-arm64.tar.gz"
    sha256 "7b1872062e558b2a8527518450b5dd5ea500cdd9e9369482534e109de50ac34e"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.68/anycloud-linux-x64.tar.gz"
    sha256 "691058145fa870c45a66c42ca0e76d57ff706212ff095c3903f16c47e486e213"
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
