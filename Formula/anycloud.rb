class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.43"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.43/anycloud-darwin-arm64.tar.gz"
    sha256 "6bcc08f73ec6074c393dc86a1270a5a8fa3042a2095ad50c1244c781f2698217"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.43/anycloud-darwin-x64.tar.gz"
    sha256 "be2736da99ff2133107ef50e97a5dda4eaa8c549d9def2dc8bc324f7ccf7b25a"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.43/anycloud-linux-arm64.tar.gz"
    sha256 "2097d09e051a0d5831182aeb862631c4327f3a6b03f2102b6ecb4a056b0bfaf7"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.43/anycloud-linux-x64.tar.gz"
    sha256 "a9c263516995c6a1c0fd0d1702344e9fabd241b21a125feddb6fd9b8774eb38f"
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
