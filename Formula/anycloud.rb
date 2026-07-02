class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.40"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.40/anycloud-darwin-arm64.tar.gz"
    sha256 "cee54d1e490b33f6e749b3d024e41f0be14dce1b2ef55255f7bf19c3fc92250d"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.40/anycloud-darwin-x64.tar.gz"
    sha256 "f9b10a46e3bd8552311bc1f6d680c7e0a37a2be83ac82ab5143cae34ebcd4094"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.40/anycloud-linux-arm64.tar.gz"
    sha256 "d986e53917412f691543f49f67f38671250db28d29c8065dbb65fe6b2c8190e3"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.40/anycloud-linux-x64.tar.gz"
    sha256 "280374e4d83d42b2db544e34f4c54972e33e01b6aef91354dcb0689a26eae742"
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
