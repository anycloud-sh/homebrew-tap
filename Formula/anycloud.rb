class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.57"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.57/anycloud-darwin-arm64.tar.gz"
    sha256 "6834655fad5fc379a85a4bb36e8e7d55bafb9fea89fc1ed2f8676bb4052826be"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.57/anycloud-darwin-x64.tar.gz"
    sha256 "a8d77c57c44dde7fe843a98785dc53a45e4fa18705c4f27c879cede564e213c0"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.57/anycloud-linux-arm64.tar.gz"
    sha256 "b8353d8f55c1eadcc350fa9f02fac61c6bcb54f03006dabbeba5283925b05780"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.57/anycloud-linux-x64.tar.gz"
    sha256 "1e02d99752c5e18d8262a6d8a9d0942ea3dfdfa31648c584c841f1fb08b95837"
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
