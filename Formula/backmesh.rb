class Backmesh < Formula
  desc "CI runners for GitHub Actions in your own cloud"
  homepage "https://github.com/anycloud-sh/backmesh-releases"
  version "0.3.0"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.0/backmesh-darwin-arm64.tar.gz"
    sha256 "7bdb6af35ac8f2fbae13c4f07ccab65d511babf17e69f0dc845d846f0eca932a"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.0/backmesh-darwin-x64.tar.gz"
    sha256 "4db4fc0ad9f6afb8ab531eef48e04e33989cb4ac0ab525eb042d9dad5dbbed3b"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.0/backmesh-linux-arm64.tar.gz"
    sha256 "af8b08e7b6b26bed975a9afa81599bf29f74043ff4ec0dbeb4d266cbf76dc584"
  else
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.0/backmesh-linux-x64.tar.gz"
    sha256 "be195f0bd0fa93c80e2a4ac63de33707649288583682a397d8e41f0604d95375"
  end

  def install
    bin.install "backmesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/backmesh --version")
  end
end
