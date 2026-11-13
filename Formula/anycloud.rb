class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.77"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.77/anycloud-darwin-arm64.tar.gz"
    sha256 "0df524367d802fe9c27e418f99a9e85a2c4788c903e36573658d6fef85384a38"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.77/anycloud-darwin-x64.tar.gz"
    sha256 "8ff698af262acc2c2b08d9b22411564d7e2adc7b4017c7a8c1ec146c1b3bca19"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.77/anycloud-linux-arm64.tar.gz"
    sha256 "c7caf41d383a76dce19a4dac0614fdd49720b1a332a5138bc221038a5c1683ef"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.77/anycloud-linux-x64.tar.gz"
    sha256 "9d93276292e09c6c14377f829428d9503801cceaa3a630b2ec4fa89744448dbd"
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
