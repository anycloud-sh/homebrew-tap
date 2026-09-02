class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.62"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.62/anycloud-darwin-arm64.tar.gz"
    sha256 "57fcabfd79d1c5e5d366514c201ef67aa3968fbd67aff91a59e995e03ae917cc"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.62/anycloud-darwin-x64.tar.gz"
    sha256 "df77c873c53697baf54d22350e5085ea6c1f7e91e467f3a280f25821ac601a58"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.62/anycloud-linux-arm64.tar.gz"
    sha256 "131c7a119968b2061c44342432eb5a25ac9cdbf24e5029076f0bc44f454d0c0a"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.62/anycloud-linux-x64.tar.gz"
    sha256 "5d1846ea54fb13ed9e0c63e7d72e8b89f807a7c1a3eacdb238f1406ed6eac12b"
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
