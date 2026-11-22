class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.80"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.80/anycloud-darwin-arm64.tar.gz"
    sha256 "b4d4144f7d5da3afbac28f9b2dde025f8a35f7b65954fecc3d004689f7b915be"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.80/anycloud-darwin-x64.tar.gz"
    sha256 "c744891fdc6d85b932db0b8c60c3fa11731ea2dcafe1cba244a1079521521cf7"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.80/anycloud-linux-arm64.tar.gz"
    sha256 "41923aa5569dc5a79298089dc64ad1ef234bf18e76cd2b8489bd2a73f770a99e"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.80/anycloud-linux-x64.tar.gz"
    sha256 "817163500bb3caf6b80751c477883d9e4f931cda8e07aa870e477a9301a62912"
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
