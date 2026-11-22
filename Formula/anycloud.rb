class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.81"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.81/anycloud-darwin-arm64.tar.gz"
    sha256 "0c51ba41c1b5d0b12564b30142c91deb574b8ba4076f030df843b1ecc3f13d02"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.81/anycloud-darwin-x64.tar.gz"
    sha256 "5c968e7e278324763ba3af9142384869ff6c4113f1319759abf484df2e8a0e89"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.81/anycloud-linux-arm64.tar.gz"
    sha256 "27197c431208c5523634f78638b9ddca2cfebd77538ffa2fb67313e6c05b9840"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.81/anycloud-linux-x64.tar.gz"
    sha256 "183b7f04a1703c4f179a3310fe304f21d3b6756970b0f3b66c5913d14e00e5d2"
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
