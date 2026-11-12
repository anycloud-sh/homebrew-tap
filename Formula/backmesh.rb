class Backmesh < Formula
  desc "CI runners for GitHub Actions in your own cloud"
  homepage "https://github.com/anycloud-sh/backmesh-releases"
  version "0.3.2"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.2/backmesh-darwin-arm64.tar.gz"
    sha256 "530fa798f37603dfcc169c44eaa6394703844c400510a7dd6e818b776bfe68af"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.2/backmesh-darwin-x64.tar.gz"
    sha256 "bcef19101258e691913d33114db909b73969be8bf09fa8c81733480eee189908"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.2/backmesh-linux-arm64.tar.gz"
    sha256 "13f9c6ee6e25d2f97353ebe8734d39d57d2497ac607c9a9f9359e1589c5c42e3"
  else
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.2/backmesh-linux-x64.tar.gz"
    sha256 "d7eeb5f2aeca3fecf392d9878914b0c30bf2c0849b5797297321782c9c8f74cf"
  end

  def install
    bin.install "backmesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/backmesh --version")
  end
end
