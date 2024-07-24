class Nax < Formula
  desc "Command-line interface for the NAX platform"
  homepage "naxgrp.com"
  version "0.3.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.3.0/nax-0.3.0-linux-x86_64.zip"
      sha256 "c3e46fe360090fae063a908698a833ad15dfd8382e525539f2baec4f71b2a572"
    end
  end
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.3.0/nax-0.3.0-darwin-arm64.zip"
      sha256 "c013cc42602d5a1d1c2112b411575fabf3c97c054b347058c090ff39f942da04"
    else
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.3.0/nax-0.3.0-darwin-x86_64.zip"
      sha256 "31f7bf324a119367499bf5c592c90ddfa51a9df31057689b9a29663ec38f036c"
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
