class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.31"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.31/anycloud-darwin-arm64.tar.gz"
    sha256 "b82545455d88be0082e55b1ff0c0c30086e33df8aa378800cadefc3c99ba4792"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.31/anycloud-darwin-x64.tar.gz"
    sha256 "2eb7b152b97ed9c03eca18d248df435885dbb1736bd66fc5a9dadcb2165d7629"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.31/anycloud-linux-arm64.tar.gz"
    sha256 "151daf1f5b56e5475eaba04adae3ac2bd0ad2d87bc52faf02c031778cdc593df"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.31/anycloud-linux-x64.tar.gz"
    sha256 "d7a5ac80bbfafbe270803bb45022ab31e71949a479b5133ac59414a21e7cd328"
  end

  def install
    bin.install "anycloud"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/anycloud --version")
  end
end
