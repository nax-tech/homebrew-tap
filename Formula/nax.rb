class Nax < Formula
  desc "Command-line interface for the NAX platform"
  homepage "naxgrp.com"
  version "0.2.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.2.0/nax-0.2.0-linux-x86_64.zip"
      sha256 "76ba03e7f17a52678840fe9ebb88cd6840bc43d656dc301bc388dc41d90f6355"
    end
  end
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.2.0/nax-0.2.0-darwin-arm64.zip"
      sha256 "c2a35e9687ac94c1967306b65bc57ba5dc5bf6514a7ee53b2750a2ba843aed52"
    else
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.2.0/nax-0.2.0-darwin-x86_64.zip"
      sha256 "26458ec182328932fedf2f5b5e6b6867d6d3116969d1fa034f14682416725666"
    end
  end

  # depends_on "awscli"
  # depends_on "azure-cli"
  # depends_on "git"

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
