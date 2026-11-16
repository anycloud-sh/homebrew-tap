class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.78"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.78/anycloud-darwin-arm64.tar.gz"
    sha256 "6d24b2589cacc961c826a1fbe86740b71d3c84049f420f5122a2d88067c7498e"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.78/anycloud-darwin-x64.tar.gz"
    sha256 "564490936e506bc4005c8e29e22b870e82f0e1951b2137efd2f0dc4ca85c2b3b"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.78/anycloud-linux-arm64.tar.gz"
    sha256 "4c6a998d2e1687ef080d9eebea0bc42e2ed88554c0079f4f031af62806d54915"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.78/anycloud-linux-x64.tar.gz"
    sha256 "5fb5ac58ae549f47738a9e10fda17735987693eeebe5f71ae578d944b36e4ba3"
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
