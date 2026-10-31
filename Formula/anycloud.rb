class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.71"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.71/anycloud-darwin-arm64.tar.gz"
    sha256 "6b590a159a730294d856556df805cb4d85ee93c709f6af260970d037aa972f1e"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.71/anycloud-darwin-x64.tar.gz"
    sha256 "68d36ee83e84f3558e8d50043ca5493112f70101d3ab1301f7724e604ad451a2"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.71/anycloud-linux-arm64.tar.gz"
    sha256 "589df9515a3432000f1a0f8aa67cdda1c722682558ebe48a3679fc0e346cf01b"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.71/anycloud-linux-x64.tar.gz"
    sha256 "762d7806d163e69bcb38aa6503ad69814329eaf6e071f389ded0ad3bcc21aff0"
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
