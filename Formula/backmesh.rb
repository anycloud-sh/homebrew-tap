class Backmesh < Formula
  desc "CI runners for GitHub Actions in your own cloud"
  homepage "https://github.com/anycloud-sh/backmesh-releases"
  version "0.3.3"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.3/backmesh-darwin-arm64.tar.gz"
    sha256 "8b66867110a9565c34a23b6b09f17ce45ed65388196d7d8dbd1e014a454a3660"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.3/backmesh-darwin-x64.tar.gz"
    sha256 "5070b6a938eeb382bd5fef181c99866f828d5cc8d1d97a09ee4afc7e874c3a12"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.3/backmesh-linux-arm64.tar.gz"
    sha256 "676af883545bcd10aa5a06b40fc0b318ae9c2d78682f20495404402b571b32cc"
  else
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.3/backmesh-linux-x64.tar.gz"
    sha256 "e2f92fb49778d912348c68fc10d24368d36807e8725f0b7381bcf6991ed32f4f"
  end

  def install
    bin.install "backmesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/backmesh --version")
  end
end
