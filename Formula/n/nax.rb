class Nax < Formula
  desc "Command-line interface for the NAX platform"
  homepage "naxgrp.com"
  version "0.1.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.1.13/nax-0.1.13-darwin-arm64.zip"
      sha256 "160fa5be4eec0aac19f0c838c54f5a45a125bad7c99a4db639a16d4905619183"

      def install
        bin.install "nax"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://naxpublicstuffs.blob.core.windows.net/binaries/nax-0.1.13/nax-0.1.13-linux-x86_64.zip"
      sha256 "5bcea0da5693160c9db9fc6a2776fdfd2ac7644bfa54cc0ec8531183f0c92615"

      def install
        bin.install "nax"
      end
    end
  end

  test do
    system "#{bin}/nax --version"
  end
end
