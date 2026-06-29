class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.36"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.36/anycloud-darwin-arm64.tar.gz"
    sha256 "75eadaebf2cac79648985cfb31e5334e83e554a167a1c8ae0b79da619dced159"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.36/anycloud-darwin-x64.tar.gz"
    sha256 "8b7aaea2017d9e7fa8e8ffa91d65dab9b33953ba224d9a055e265ee4ec1d7dd0"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.36/anycloud-linux-arm64.tar.gz"
    sha256 "c3894597c277e8bc9838d2979c71ee8154798320702ff0859ef59896b682f66b"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.36/anycloud-linux-x64.tar.gz"
    sha256 "916f2e1edd397c2f16b4da24abe5bc7b3eb593fde39703d0983f0593e0e870fb"
  end

  def install
    bin.install "anycloud"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/anycloud --version")
  end
end
