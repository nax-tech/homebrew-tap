class Nax < Formula
  desc "Command-line interface for the NAX platform"
  homepage "naxgrp.com"
  version "0.1.16"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.1.16/nax-0.1.16-linux-x86_64.zip"
      sha256 "38656e343842af92e6c4c2c8adb446ff58cdb7caae0bdab18bbb5fd21bf89788"
    end
  end
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.1.16/nax-0.1.16-darwin-arm64.zip"
      sha256 "14834bea014d78c49b033e7142384ec00a7323de61fc6227ca71f9360420cfaf"
    else
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.1.16/nax-0.1.16-darwin-x86_64.zip"
      sha256 "50462d2e651f4b944a14a98c8d5a105c0955d33930a1735aba86325839d01c1c"
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
