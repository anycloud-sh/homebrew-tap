class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.33"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.33/anycloud-darwin-arm64.tar.gz"
    sha256 "93bdf766624d59b2de117bd08dc46b6625e3689e02cdd6951b7b64e61a283215"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.33/anycloud-darwin-x64.tar.gz"
    sha256 "1cacf4be90354b2e43ed826fb5fc1991697d6d8af367a46911ca06d0b17fcc66"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.33/anycloud-linux-arm64.tar.gz"
    sha256 "bd702976061af9cbe643ed394aeaa1ad712a78eafebe2dcc970bb62b489e08e9"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.33/anycloud-linux-x64.tar.gz"
    sha256 "552b3d64798cf313fe367ac644be0e79291ba97a524931e3c963ef33183c9248"
  end

  def install
    bin.install "anycloud"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/anycloud --version")
  end
end
