class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.51"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.51/anycloud-darwin-arm64.tar.gz"
    sha256 "e1b558b8fa1ad93caff1c147a463ae7da5d49023003858a009f49e400e2a5014"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.51/anycloud-darwin-x64.tar.gz"
    sha256 "1aff2a761d2c5fac73bbd20679407d05cffc89cde24f335c34015d0178ca1a29"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.51/anycloud-linux-arm64.tar.gz"
    sha256 "cf02ba93688ad3eca9562014d36862976c7f7315336016427c5dbb554a4c8d5e"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.51/anycloud-linux-x64.tar.gz"
    sha256 "c2886e66584b4c4ae5a0e2e4215f8c1ac31017c4ca5b22186c02a643baf59537"
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
