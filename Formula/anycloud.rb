class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.64"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.64/anycloud-darwin-arm64.tar.gz"
    sha256 "0cdf161914a2d57258d7b252d26467ef8d2bb41533cf5e541a85d868a3602275"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.64/anycloud-darwin-x64.tar.gz"
    sha256 "10e0510d5b787a5b8afb008f5bb937b003ea6135f89bffc3bfdc2a230a414f0e"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.64/anycloud-linux-arm64.tar.gz"
    sha256 "f149bb0a0d71c32723316d25596dd993bcc35bc44287d317443b8cec6f7e488a"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.64/anycloud-linux-x64.tar.gz"
    sha256 "35c5757ff0f8a50224230fa7752b35375beaba92d15d27a37cbebe19c80b1f44"
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
