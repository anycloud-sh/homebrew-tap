class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.67"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.67/anycloud-darwin-arm64.tar.gz"
    sha256 "3c52a09211d1ad5fad28c3d9e676929c85e364c5013e77b34051b0359524b97a"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.67/anycloud-darwin-x64.tar.gz"
    sha256 "cf066a0bba12bf4c951d8f8c3c39b79328e834943e5e97ebbd6f8e53c3cb5b3c"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.67/anycloud-linux-arm64.tar.gz"
    sha256 "bed3d77b7add9f090407cb0be7be86abb870c659b8b6f8f0ecf78e034622680d"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.67/anycloud-linux-x64.tar.gz"
    sha256 "18d02b5368777f9c6e997bd53e143af6592e9a565a62c5119ec7f31ee3995f6a"
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
