class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.73"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.73/anycloud-darwin-arm64.tar.gz"
    sha256 "a321d985f245504c3ff5700050a24bfd294a1f94dd3f6bec27d3a2c23f3d9416"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.73/anycloud-darwin-x64.tar.gz"
    sha256 "af145aaf90b06d9c11ced89519fc9b7443fa596f860cca45ffb426e053717abd"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.73/anycloud-linux-arm64.tar.gz"
    sha256 "6c03117970c2202a31999937e309b21a63f819694fa7671c3a0af69fcf0d64d7"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.73/anycloud-linux-x64.tar.gz"
    sha256 "23aa5d13aab6fa06cf84c35be848c9a6b2dd7c61d7f01a0cd02192c63750a9e5"
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
