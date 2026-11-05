class Backmesh < Formula
  desc "CI runners for GitHub Actions in your own cloud"
  homepage "https://github.com/anycloud-sh/backmesh-releases"
  version "0.1.4"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.1.4/backmesh-darwin-arm64.tar.gz"
    sha256 "f78bd7b79d399ffd1a82468ea1f2bb13e99c8ab2897b7d330dc8be9c4d388c4d"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.1.4/backmesh-darwin-x64.tar.gz"
    sha256 "d77c7450e0306a2ad9cfd67b68e40922484fb07d51edc447469c91e590357af2"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.1.4/backmesh-linux-arm64.tar.gz"
    sha256 "06b14b8c7f46937672a6b5f17a994f7cac1fc335d6cd797459101e195843e81e"
  else
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.1.4/backmesh-linux-x64.tar.gz"
    sha256 "83e99f2a3f68777160398472d666928182f7d07f5bcf7d06bd296b024c90c131"
  end

  def install
    bin.install "backmesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/backmesh --version")
  end
end
