class Nax < Formula
  desc "Command-line interface for the NAX platform"
  homepage "naxgrp.com"
  version "0.2.2"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.2.2/nax-0.2.2-linux-x86_64.zip"
      sha256 "1ea20ac8722f075a150553651786c232ce246280b063b2f93e03e2c89d0eae1a"
    end
  end
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.2.2/nax-0.2.2-darwin-arm64.zip"
      sha256 "14141ea4009677fd378dc6038a0211c280c62b02cb9217c8d689c3f9f8d01881"
    else
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.2.2/nax-0.2.2-darwin-x86_64.zip"
      sha256 "5ced543c9233c38e2eb8f710bebb0e43231b3a34f2c6a31730e0170e7ae597a5"
    end
  end

  depends_on "awscli"
  depends_on "azure-cli"
  depends_on "git"

  livecheck do
    url "https://naxpublicstuffs.blob.core.windows.net/binaries?comp=list&restype=container"
    regex %r{<Name>nax-(\d+\.\d+\.\d+?)/}i
  end

  def install
    bin.install "nax"
  end

  test do
    system "#{bin}/nax --version"
  end

  def caveats
    <<~EOS
      If you previously installed nax-cli via the cargo command, you may need to uninstall it with `cargo uninstall nax`
      to ensure that the nax binary you installed with Homebrew is used instead.
    EOS
  end
end
