class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.38"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.38/anycloud-darwin-arm64.tar.gz"
    sha256 "2cedee13bc2ce54e72170c278f35abb346ae9c8cacadd79587ef219836f63068"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.38/anycloud-darwin-x64.tar.gz"
    sha256 "4897a16aaa6f17e4fd6074ae739e526692c9d5b20fa6ea56bd741c008be42b6e"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.38/anycloud-linux-arm64.tar.gz"
    sha256 "9329daac279351948a43e6a1cf520395c22c295d7b55c876cc98b12c66706f5e"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.38/anycloud-linux-x64.tar.gz"
    sha256 "43e26cd7db5cd439561d0860f025fd15584c59ba74bbb180020c14e8c2f87969"
  end

  def install
    bin.install "anycloud"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/anycloud --version")
  end
end
