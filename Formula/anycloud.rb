class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.60"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.60/anycloud-darwin-arm64.tar.gz"
    sha256 "d27a272eb0f2b3dcc64455a1495b3324d52d2947959dbd52340bdf06f35ada09"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.60/anycloud-darwin-x64.tar.gz"
    sha256 "03f188efc8117a44d73ff6696b5b38c6eb2ddfcc88c938bd66fa103f0082ef65"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.60/anycloud-linux-arm64.tar.gz"
    sha256 "c131d9ef5c44d3dc418f7734e3909afba2b4e7f1f9227ad48b9ae145c5b01f0d"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.60/anycloud-linux-x64.tar.gz"
    sha256 "db5d99a3aef79f1a3c456274ccf1e38d61ab91a955f96504273a95f13a56beab"
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
