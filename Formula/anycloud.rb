class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.48"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.48/anycloud-darwin-arm64.tar.gz"
    sha256 "d1d014e2b297e641a4e857ded176806dd50d6128c51913c127e01e8bd9196f08"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.48/anycloud-darwin-x64.tar.gz"
    sha256 "488b0080933ad5132a8640b8e75d0e20119fab7805704ea5d28bc3169db0168b"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.48/anycloud-linux-arm64.tar.gz"
    sha256 "4fea4a1a5e0acdf75fa90ff09abd21e0c5efe119f6f1f3d21d6460431dfb849b"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.48/anycloud-linux-x64.tar.gz"
    sha256 "d6020268c8a7309b54f8e0bb4055ea62bbede51c8c8466c2f7155bf8dbc8bffb"
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
