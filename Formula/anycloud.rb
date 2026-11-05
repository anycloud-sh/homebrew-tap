class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.72"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.72/anycloud-darwin-arm64.tar.gz"
    sha256 "6ffafa36786c93c28cfc0afb991a63a67672d8ec017e5b33b7cd8217371348e4"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.72/anycloud-darwin-x64.tar.gz"
    sha256 "11c27983925a130c18abadba5bb2d31370c3bab70bf60a1af57ff4276eadb2bd"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.72/anycloud-linux-arm64.tar.gz"
    sha256 "156b73735124278e1025b5ba71732bd6463c6f8151860d069f31f526c08d2ac6"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.72/anycloud-linux-x64.tar.gz"
    sha256 "44aa27e602a40fbb7659ed8b25441be942768d2333650ef14db1c50b30d69e09"
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
