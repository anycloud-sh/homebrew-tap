class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.74"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.74/anycloud-darwin-arm64.tar.gz"
    sha256 "bbe019c3869761cd39515b41662e728e71845cedeb971da6f040c0b529cee40a"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.74/anycloud-darwin-x64.tar.gz"
    sha256 "90a11e58fbf9adbe4cff29703717d658d9dbaaed58567cba38321e34aa4fc138"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.74/anycloud-linux-arm64.tar.gz"
    sha256 "fd943d19b9443a11894650216990c7466c248f4daa0ddd79e85f6b42ea811ceb"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.74/anycloud-linux-x64.tar.gz"
    sha256 "0095ac8f0c638ec92d82076b16e7f7922dd817fe9e09eefb112ff96ac4a73d2a"
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
