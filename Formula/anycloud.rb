class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.83"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.83/anycloud-darwin-arm64.tar.gz"
    sha256 "ab809991916286fc1dbfd2c46e7522d29bf9765f74c8c04d613a647f7747dbc4"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.83/anycloud-darwin-x64.tar.gz"
    sha256 "68ea71da402f50450eb26c8622f58fd00c550634c5b4fb03832c60767f1bd725"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.83/anycloud-linux-arm64.tar.gz"
    sha256 "6bc8f6193377f0471174aadf88d197b51027a09fc5b9d3f4b2cd8a53af7637c5"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.83/anycloud-linux-x64.tar.gz"
    sha256 "c4bfc58f29f9ec5c7a9d152a47895d5921a7c3a92e1d5b16ecd7edfa45eb2113"
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
