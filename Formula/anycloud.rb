class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.35"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.35/anycloud-darwin-arm64.tar.gz"
    sha256 "f527b33110a514d7e93cb2111518cac8649e945243cbf606d4797786c97ea53d"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.35/anycloud-darwin-x64.tar.gz"
    sha256 "a8366c7791a31a4132d285b856a5495a5ab2d061015ae9185f5c9560b965a222"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.35/anycloud-linux-arm64.tar.gz"
    sha256 "5c813dd02fdb522081b12f8afc939729a6a7e3c546368c2bce5cd8b1846143a6"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.35/anycloud-linux-x64.tar.gz"
    sha256 "f68365f052946b295167a3c38f73e4ef3cba8cdce59d32f4b5d943aeebfbcf40"
  end

  def install
    bin.install "anycloud"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/anycloud --version")
  end
end
