class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.84"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.84/anycloud-darwin-arm64.tar.gz"
    sha256 "8afbfc904b13f92ec47c40558060eef63c03569223652f55a00ac1c2ed1df8e0"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.84/anycloud-darwin-x64.tar.gz"
    sha256 "3b80540237053fa0a446ae483970b9c8d46989f1ab476d7689fbfc8d1228fe33"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.84/anycloud-linux-arm64.tar.gz"
    sha256 "a8d4f76233fe116a61a0b9bc19c09d6e44694d74c9e12add80b7156aee489acf"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.84/anycloud-linux-x64.tar.gz"
    sha256 "670c6f4c5e6b7706f7dd9661b5f77b85ca5657fd720d9c4d065fb7ecb6c231db"
  end

  def install
    bin.install "anycloud"
    prefix.install "LICENSE", "NOTICE"
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
