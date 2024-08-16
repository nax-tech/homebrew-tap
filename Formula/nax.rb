class Nax < Formula
  desc "Command-line interface for the NAX platform"
  homepage "naxgrp.com"
  version "0.3.1"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.3.1/nax-0.3.1-linux-x86_64.zip"
      sha256 "c0c4e1388f5ac357dfed787fd4c425e1abecdcf600443c871d9f34bec19e89c0"
    end
  end
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.3.1/nax-0.3.1-darwin-arm64.zip"
      sha256 "c8052578f6597b0d763bbc640555aaef916942fce8cf1fbff0c58c72a9235ce9"
    else
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.3.1/nax-0.3.1-darwin-x86_64.zip"
      sha256 "c6c28418fd3fb5badb23889d4836fb2de8fa1143ce298fe473427216c28135a9"
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
