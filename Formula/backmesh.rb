class Backmesh < Formula
  desc "CI runners for GitHub Actions in your own cloud"
  homepage "https://github.com/anycloud-sh/backmesh-releases"
  version "0.2.1"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.2.1/backmesh-darwin-arm64.tar.gz"
    sha256 "9218417f37a2b6cb6a6aa5420887777490cdedc6dc30d8fcf6dbb8937ba913f3"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.2.1/backmesh-darwin-x64.tar.gz"
    sha256 "b8f51eee94626b8034dafc106b783e57a6fc22f27852e9b8ab20ebf418d9c861"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.2.1/backmesh-linux-arm64.tar.gz"
    sha256 "3475242c1f88b37180a5b49e898929d268c2d18dc4b87e92b99079a6e1a625a3"
  else
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.2.1/backmesh-linux-x64.tar.gz"
    sha256 "92ad879b7fa23d46c3ad03d28914060d7ea428fea1c64758827de828e9e0ab4c"
  end

  def install
    bin.install "backmesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/backmesh --version")
  end
end
