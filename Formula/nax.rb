class Nax < Formula
  desc "Command-line interface for the NAX platform"
  homepage "naxgrp.com"
  version "0.1.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.1.15/nax-0.1.15-darwin-arm64.zip"
      sha256 "eace178f232884ca50188a6838878a25b6537195bf3ce2b6a270a70dd286c467"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.1.15/nax-0.1.15-linux-x86_64.zip"
      sha256 "2992a33e196e3aaf099e6196d2c7e7eb4c11a279a2c82b58333f70bea799fdfe"
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
