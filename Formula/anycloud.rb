class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.59"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.59/anycloud-darwin-arm64.tar.gz"
    sha256 "65b5f8fb3e6eee0354bc65099c14825a103a606cc5840d9b48f536b9c8e1d51d"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.59/anycloud-darwin-x64.tar.gz"
    sha256 "6406b4fed552e31efbddd0ed4aa45f374b3594c78dd140ff5f5fdb8c2d15dad4"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.59/anycloud-linux-arm64.tar.gz"
    sha256 "58a45709f3d007564c0abf12cb72a67755140a50b3e428f3d947ad268b328106"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.59/anycloud-linux-x64.tar.gz"
    sha256 "b7cf2ff0c65aa0115b93ef0fa82392ae57eefd02f6f9214f92bd6e4a20b4ace4"
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
