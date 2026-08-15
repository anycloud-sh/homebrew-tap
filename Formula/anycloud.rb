class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.58"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.58/anycloud-darwin-arm64.tar.gz"
    sha256 "588d089bb798ed92a7a78ddc2b51a1a31ad9cc429acba246a703c02d20edf30e"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.58/anycloud-darwin-x64.tar.gz"
    sha256 "27cb944cf0735ada5a053a15c8ccb88a19a87ef27a59a741a28ee6ca407102a9"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.58/anycloud-linux-arm64.tar.gz"
    sha256 "534986d1f42e939a23bd3fed4b1b7b757608f201522925012148535149f85022"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.58/anycloud-linux-x64.tar.gz"
    sha256 "d929743b3a796782f838335d64e18042f972d1870dbbdf3b0e9d081f78fc3f24"
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
