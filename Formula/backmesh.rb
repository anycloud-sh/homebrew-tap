class Backmesh < Formula
  desc "CI runners for GitHub Actions in your own cloud"
  homepage "https://github.com/anycloud-sh/backmesh-releases"
  version "0.2.0"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.2.0/backmesh-darwin-arm64.tar.gz"
    sha256 "f58c66c025a7acc92fb430a9720a8fb46563697acab1724983e6fe04339b290e"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.2.0/backmesh-darwin-x64.tar.gz"
    sha256 "be5e4df23abdef32867243a64e8605be342598be8d1b41e41361a7e1330ce253"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.2.0/backmesh-linux-arm64.tar.gz"
    sha256 "312f56b7989f9f3db479abafc7d6396851919269fbc46cdb687d2fc000b6b554"
  else
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.2.0/backmesh-linux-x64.tar.gz"
    sha256 "cdd6de6057fdf12f6f3fba5a83970cddb4b13f00b3112e8d50e8a69ffbb16210"
  end

  def install
    bin.install "backmesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/backmesh --version")
  end
end
