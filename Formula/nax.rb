class Nax < Formula
  desc "Command-line interface for the NAX platform"
  homepage "naxgrp.com"
  version "0.4.1"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.4.1/nax-0.4.1-linux-x86_64.zip"
      sha256 "c16082f347832fddf34e75215c0af02d8a221a1b4091ae9219e54213559cd974"
    end
  end
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.4.1/nax-0.4.1-darwin-arm64.zip"
      sha256 "bf58f09e66ca82424930e53744487fdfcb0de542a7bf2bde74b812777522633f"
    else
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.4.1/nax-0.4.1-darwin-x86_64.zip"
      sha256 "985f31ab55fe93a4b5dea49f27d55a8f7d81add322b6f828336c1757e2f34a9b"
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
