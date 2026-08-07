class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.55"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.55/anycloud-darwin-arm64.tar.gz"
    sha256 "a2fec1322b79bab91ae104426f61f5c2fac9f73e260da66df46763ff3c14ce7f"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.55/anycloud-darwin-x64.tar.gz"
    sha256 "859a2329be712c9947390fba9584cc3a57c17a2b03744abaee1d80413a953648"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.55/anycloud-linux-arm64.tar.gz"
    sha256 "886f3dbbf1eb2be6418aa942b4d8b1b913583cc9bdbd78e758938b102a2f60ef"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.55/anycloud-linux-x64.tar.gz"
    sha256 "e5a21cd35665b1281c2ef909a5ca03aa6833b763f0c24ae54f9df98f9322f9dd"
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
