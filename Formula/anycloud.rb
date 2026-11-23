class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.82"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.82/anycloud-darwin-arm64.tar.gz"
    sha256 "5de35a0e2a43f3e2c6cf7b022d9c7acd2ebcaba6c634853a740ffb2242bc6f7c"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.82/anycloud-darwin-x64.tar.gz"
    sha256 "a56f965a3049fa5b555860c6db74c0e0e15176fd6d8504c2870dd25515814074"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.82/anycloud-linux-arm64.tar.gz"
    sha256 "3a7707c252fe768e6c45d8c6ea176bbb18fdb444c8f2de4751dbc82cb8d06a69"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.82/anycloud-linux-x64.tar.gz"
    sha256 "fbf97dd89a893d7059cd55a7c4f929539b9fb74927088b25c437816c42bb917c"
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
