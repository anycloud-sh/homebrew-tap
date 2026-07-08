class Anycloud < Formula
  desc "Run AI workloads on any cloud account to find the cheapest GPU"
  homepage "https://anycloud.sh"
  version "0.1.44"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.44/anycloud-darwin-arm64.tar.gz"
    sha256 "ebc054131f1acbb42a82dd47e3d8ce747ac5b012be8b906497581d572d84e38f"
  elsif OS.mac?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.44/anycloud-darwin-x64.tar.gz"
    sha256 "f86b54fbac4c6dc6ec55a4c52604be322168a62a67723b3abfe6e315cd72a1c4"
  elsif Hardware::CPU.arm?
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.44/anycloud-linux-arm64.tar.gz"
    sha256 "7b5336a1bdbeab002fe8a3a39793694ee7cf556ac1fb05130b629d0a154403ea"
  else
    url "https://github.com/anycloud-sh/releases/releases/download/v0.1.44/anycloud-linux-x64.tar.gz"
    sha256 "6795c1d6a1f3be876dfb81719071eebca7954ee30844cbdfa5ae23fdad59c9b8"
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
