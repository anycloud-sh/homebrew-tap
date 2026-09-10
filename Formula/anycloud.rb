class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.63"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.63/anycloud-darwin-arm64.tar.gz"
    sha256 "6c2bbae63241fd8c9e0bab411624ec5eb313b8077cf8620bf9f73e891d9e0e26"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.63/anycloud-darwin-x64.tar.gz"
    sha256 "be56eea6fe63d84016b90944c7cf051c0ddcb2cbc6363b214b8116794bcfb5bc"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.63/anycloud-linux-arm64.tar.gz"
    sha256 "a171978a510ae142c85655e9c8fb9aec9d101175a551f8a3b3611eb86cfbef7f"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.63/anycloud-linux-x64.tar.gz"
    sha256 "06b4fc4f7bea86366cab37189a073aab4fb532c40abc663231d49a47f8aa2975"
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
