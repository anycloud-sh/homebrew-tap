class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.49"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.49/anycloud-darwin-arm64.tar.gz"
    sha256 "605c942642142aa6b87a14213240c1a2e51fec77929fc43b24abacb889132d4a"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.49/anycloud-darwin-x64.tar.gz"
    sha256 "6863d12179cc27f0e8f988c370db02ff61d95493f441f6a5d857c7ab18f43204"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.49/anycloud-linux-arm64.tar.gz"
    sha256 "a56892acd8c4dbfffc342b5f2ab38c4ea08dbbc70e521cbe29a2c890a5b7aa20"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.49/anycloud-linux-x64.tar.gz"
    sha256 "6a66afa6744abdd7e94023a697ba490ac450774748233e88b91044a7090ba38e"
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
