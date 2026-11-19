class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.79"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.79/anycloud-darwin-arm64.tar.gz"
    sha256 "2535dab519a3df8137a8b9be459445e2ee29e64e324934cbb25f6ae1079cd3f8"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.79/anycloud-darwin-x64.tar.gz"
    sha256 "f20c6c5efd8edd545fd3040229792fe6a0c4fdd71be2d96d6505f16342edd309"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.79/anycloud-linux-arm64.tar.gz"
    sha256 "556e385a66786f82b334d91da811dfa5f9c5b18707e9b8ec473bafdf28c86d0a"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.79/anycloud-linux-x64.tar.gz"
    sha256 "e5d69326b694f91c9465dc77f34d7175a651278826c629718b0e049b2ec3434d"
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
