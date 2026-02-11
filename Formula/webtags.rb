class Webtags < Formula
  desc "Git-synced browser bookmark tagging with native messaging host"
  homepage "https://github.com/adjmunro/webtags"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/adjmunro/webtags/releases/download/v0.1.2/webtags-0.1.2-aarch64-macos.tar.gz"
      sha256 "6af1754eb5ae4334575945a865a8d6cce3e4a875538c2f7e43e06c4c8aa282b5"
    else
      odie "Intel macOS is not supported. Please use an Apple Silicon Mac or build from source."
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/adjmunro/webtags/releases/download/v0.1.2/webtags-0.1.2-x86_64-linux.tar.gz"
      sha256 "005ad7a4ec81ef3574031371f42cef21bb2e6c76fdd2f9de52b8e0f7e653be10"
    else
      odie "Only x86_64 Linux is supported. Please build from source for other architectures."
    end
  end

  def install
    # Install the pre-built binary
    bin.install "webtags-host"

    # Install native messaging manifests
    install_native_messaging_manifests
  end

  def install_native_messaging_manifests
    # Get the full path to the installed binary
    host_path = "#{bin}/webtags-host"

    # Chrome manifest
    chrome_manifest_dir = "#{prefix}/chrome-native-messaging"
    chrome_manifest = {
      "name" => "com.webtags.host",
      "description" => "WebTags Native Messaging Host",
      "path" => host_path,
      "type" => "stdio",
      "allowed_origins" => [
        "chrome-extension://EXTENSION_ID_HERE/"
      ]
    }

    # Firefox manifest (slightly different format)
    firefox_manifest_dir = "#{prefix}/firefox-native-messaging"
    firefox_manifest = {
      "name" => "com.webtags.host",
      "description" => "WebTags Native Messaging Host",
      "path" => host_path,
      "type" => "stdio",
      "allowed_extensions" => [
        "webtags@example.com"
      ]
    }

    # Safari manifest (same as Chrome for Safari Web Extensions)
    safari_manifest_dir = "#{prefix}/safari-native-messaging"
    safari_manifest = chrome_manifest.dup

    # Write manifests
    mkdir_p chrome_manifest_dir
    mkdir_p firefox_manifest_dir
    mkdir_p safari_manifest_dir

    File.write("#{chrome_manifest_dir}/com.webtags.host.json", JSON.pretty_generate(chrome_manifest))
    File.write("#{firefox_manifest_dir}/com.webtags.host.json", JSON.pretty_generate(firefox_manifest))
    File.write("#{safari_manifest_dir}/com.webtags.host.json", JSON.pretty_generate(safari_manifest))
  end

  def caveats
    <<~EOS
      WebTags native messaging host has been installed at: #{bin}/webtags-host

      🚀 Quick Setup (Recommended)
      ═══════════════════════════════════════════════════════════════

      Run this command to automatically configure all your browsers:

        curl -sSL https://raw.githubusercontent.com/adjmunro/webtags/master/scripts/setup-manifests.sh | bash

      This detects and configures:
        ✓ Chrome, Edge, Brave, Chromium (including ungoogled variants)
        ✓ Firefox, Zen Browser, Waterfox, LibreWolf
        ✓ Safari

      📖 Manual Setup
      ═══════════════════════════════════════════════════════════════

      If you prefer manual configuration:
        https://github.com/adjmunro/webtags/blob/master/docs/BROWSER_SETUP.md

      📦 Next Steps
      ═══════════════════════════════════════════════════════════════

      1. Run the setup script above (or manually configure)
      2. Install the WebTags browser extension (coming soon)
      3. Extension will automatically connect to the native host

      For more information: https://github.com/adjmunro/webtags
    EOS
  end

  test do
    # Test that the binary exists and responds to status message
    output = pipe_output("#{bin}/webtags-host 2>/dev/null", "\x11\x00\x00\x00{\"type\":\"status\"}", 0)
    assert_match "success", output
  end
end
