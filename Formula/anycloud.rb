class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.69"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.69/anycloud-darwin-arm64.tar.gz"
    sha256 "934cd792938087d49aa4b91d9bda5ccb50b788af2ae98e71cfe5920d23e8cb99"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.69/anycloud-darwin-x64.tar.gz"
    sha256 "fcdb046a2e398750f94521301b3f054a28fce0023717ef6bdbb6693e42653b78"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.69/anycloud-linux-arm64.tar.gz"
    sha256 "43062527b798f9bfa9566d7f07aba009f39a83fe4304df68cbdf4a4fe62a8077"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.69/anycloud-linux-x64.tar.gz"
    sha256 "1c77b6936aca414fa0dfceb5081b097ed51464804582c8bf14dcdeb8d770d652"
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
