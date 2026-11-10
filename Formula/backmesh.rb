class Backmesh < Formula
  desc "CI runners for GitHub Actions in your own cloud"
  homepage "https://github.com/anycloud-sh/backmesh-releases"
  version "0.3.1"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.1/backmesh-darwin-arm64.tar.gz"
    sha256 "b7176d1408c59601788b437ee473a063ac1fc1345c5d6d66605f82a4261d5154"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.1/backmesh-darwin-x64.tar.gz"
    sha256 "fe4d3684c2af892f07fd1403ef4a94aa2acc6d01b564de2fb412ce37b2a009bf"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.1/backmesh-linux-arm64.tar.gz"
    sha256 "3891153b3246d6ab8df8010836673b333590201cf414f3fd5cb0b459853b8421"
  else
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.1/backmesh-linux-x64.tar.gz"
    sha256 "12df9837d1442d72171d114ab4f0a8fec5dee5514f5a3f32f073d2705a07a897"
  end

  def install
    bin.install "backmesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/backmesh --version")
  end
end
