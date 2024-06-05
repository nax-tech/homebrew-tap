class Nax < Formula
  desc "Command-line interface for the NAX platform"
  homepage "naxgrp.com"
  version "0.2.1"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.2.1/nax-0.2.1-linux-x86_64.zip"
      sha256 "4735629294358b6c3d8909ac7f6bab2ad9c9a8dbc44290bf1c64ca58d2423422"
    end
  end
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.2.1/nax-0.2.1-darwin-arm64.zip"
      sha256 "9ca01b85ed7d3e7c96b6337c21751af044b0051057f13816ba8375dc2e9145a4"
    else
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.2.1/nax-0.2.1-darwin-x86_64.zip"
      sha256 "569c5e68575f7b3a3c775744377487c4d3e8348e9e17771abcee0718904e8e58"
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
