class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.53"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.53/anycloud-darwin-arm64.tar.gz"
    sha256 "1d1657c0525b9430e7a40c5aa6fdc0c85a9ee89fa3b8bb5ec3a4debaa9b4403a"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.53/anycloud-darwin-x64.tar.gz"
    sha256 "428aadaca81de2c1cf702bf633e937c1accad447b7686c41c373d4546f41918a"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.53/anycloud-linux-arm64.tar.gz"
    sha256 "ada3f8e69f9070ccc30406b8fcb966104cbc2a3ba3cf180f5dd1f95912bab845"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.53/anycloud-linux-x64.tar.gz"
    sha256 "e204b7c83d7f736530473129b4ce506d2b6310687a3739ef7484c33f1b27659e"
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
