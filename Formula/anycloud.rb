class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.50"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.50/anycloud-darwin-arm64.tar.gz"
    sha256 "f4433bcf025cdfc53651d49979bffe569d06515e55a4fc2e251abd8c7d2cb00e"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.50/anycloud-darwin-x64.tar.gz"
    sha256 "05c8aa903309d43dab95216a8dfbe40ff96bf381d3b126bc2d8ebf164d062099"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.50/anycloud-linux-arm64.tar.gz"
    sha256 "fe3b7a82e382f166d5d1eb5c51a234a6f8ff1d6544fc943ab6a5bf1336a6fcf0"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.50/anycloud-linux-x64.tar.gz"
    sha256 "f12a4c3f246ff5d7f725477a276301017901b6b8e2ececaaecc43baa40c68c33"
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
