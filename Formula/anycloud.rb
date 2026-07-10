class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.47"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.47/anycloud-darwin-arm64.tar.gz"
    sha256 "74841a38f741f3080b48f99e18835f581c2887ad5ea716b6b8eced465f9de7bf"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.47/anycloud-darwin-x64.tar.gz"
    sha256 "65778949dfac1523667a9b405837e5e1411a2b924ff7e4bc104cf439650168c5"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.47/anycloud-linux-arm64.tar.gz"
    sha256 "c7a9e708c2524afe69867fa8c5c3e0bd0aea425b5d53dbdeed58f6620192400c"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.47/anycloud-linux-x64.tar.gz"
    sha256 "5cbddc3359358eea023bd964465fe77c15fa3ea4350cabb5630a94232370648b"
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
