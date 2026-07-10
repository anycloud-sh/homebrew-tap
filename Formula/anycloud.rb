class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.46"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.46/anycloud-darwin-arm64.tar.gz"
    sha256 "2537303e3af260ed65d9865f47d4bc110f85f0de3dcbe957780f57b76904a2c1"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.46/anycloud-darwin-x64.tar.gz"
    sha256 "fd8a4755894204f428798ab56495357b0e8becdaf289ab576712e0037525d7d2"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.46/anycloud-linux-arm64.tar.gz"
    sha256 "dcb79901a993756fec170ae63c613d6e086a2aa9deacb46bbb97633bac2232be"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.46/anycloud-linux-x64.tar.gz"
    sha256 "3e5c9b3debfa04140bbf0e2a052ce75a4b3334ed69034b0ac26b0a45d15463f1"
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
