class Nax < Formula
  desc "Command-line interface for the NAX platform"
  homepage "naxgrp.com"
  version "0.4.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.4.0/nax-0.4.0-linux-x86_64.zip"
      sha256 "6fa6899a7c398c0c22444b6d96063d68e8bbb9da52a03bcaec9626785835fefe"
    end
  end
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.4.0/nax-0.4.0-darwin-arm64.zip"
      sha256 "40749e72a8bae2de4d56b9552737b95fa3719789d41d14affe9d307496adfe02"
    else
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.4.0/nax-0.4.0-darwin-x86_64.zip"
      sha256 "29de28de032898ca8b8f18ecd13bb80d74196f8e93ba9a06a87cfd3cd998b6fc"
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
