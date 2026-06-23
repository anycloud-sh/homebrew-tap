class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.32"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.32/anycloud-darwin-arm64.tar.gz"
    sha256 "fcfd829501b3053d5e4c644b35aeb104700014968ceb4095335fff594768c13c"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.32/anycloud-darwin-x64.tar.gz"
    sha256 "213515a0042482d375765069f696877fc6062e8fc91c5382c10a9a8c06a6cec9"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.32/anycloud-linux-arm64.tar.gz"
    sha256 "c9c7e9896ec6c4311c1738edc2cd73c6cc9e19dee8529de6cf7131dd7e0d5859"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.32/anycloud-linux-x64.tar.gz"
    sha256 "e667c2010b46a7c0316e9a5eb02dafbefc11e2f0ff11254f0cd757d35ee05d7a"
  end

  def install
    bin.install "anycloud"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/anycloud --version")
  end
end
