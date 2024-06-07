class Nax < Formula
  desc "Command-line interface for the NAX platform"
  homepage "naxgrp.com"
  version "0.2.3"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.2.3/nax-0.2.3-linux-x86_64.zip"
      sha256 "6de799571925d466e6a76603283f7d5ca89c1fd8fdb88e3e88f6722c3a0a9d44"
    end
  end
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.2.3/nax-0.2.3-darwin-arm64.zip"
      sha256 "cba30c90c1467a1bab18495081943ec2b4b16cb987abb480a23f445fe8d61204"
    else
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.2.3/nax-0.2.3-darwin-x86_64.zip"
      sha256 "46fa760b250bd64bdcf8320c1a9ce7965cc0c8110131bd7cb327b9784212d167"
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
