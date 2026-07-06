class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.42"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.42/anycloud-darwin-arm64.tar.gz"
    sha256 "3699fa168a0857a3348a173ac5db29365eb322ba2cb1dce0a93d5c3059558d01"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.42/anycloud-darwin-x64.tar.gz"
    sha256 "e8a5f19ad75cd0b6e3f3e18a206fb4f5d78d96f86bac8165df3b354881dee16c"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.42/anycloud-linux-arm64.tar.gz"
    sha256 "60e5306eb01f71a5b2b53a4e4184041c36a977c7cd9d0dc08184f4a954dd1b62"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.42/anycloud-linux-x64.tar.gz"
    sha256 "ce5ce0a62c5b165238cc6555275bc18aa9e194d02727f255d735d61b81519890"
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
