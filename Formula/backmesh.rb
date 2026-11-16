class Backmesh < Formula
  desc "CI runners for GitHub Actions in your own cloud"
  homepage "https://github.com/anycloud-sh/backmesh-releases"
  version "0.3.4"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.4/backmesh-darwin-arm64.tar.gz"
    sha256 "9193859cf92f4abbac0833a5f88f389fae2b97653e489e790f1a1dae9407bf73"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.4/backmesh-darwin-x64.tar.gz"
    sha256 "c8066e1172b6cac4c7c7a437ac4700c0fe58bfc24ee1a1cf0cb0af0808409811"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.4/backmesh-linux-arm64.tar.gz"
    sha256 "277814e6ae70d96ce2dc35fb0c7367762eca8a40802b237c5b6be53fa479890d"
  else
    url "https://github.com/anycloud-sh/backmesh-releases/releases/download/v0.3.4/backmesh-linux-x64.tar.gz"
    sha256 "20e804300f93666bc7356af42b1ba8375e3b176df8d4853d580ad34834e42a4b"
  end

  def install
    bin.install "backmesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/backmesh --version")
  end
end
