class Webtags < Formula
  desc "Git-synced browser bookmark tagging with native messaging host"
  homepage "https://github.com/adjmunro/webtags"
  url "https://github.com/adjmunro/webtags/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8284636c911c3c8e0cdbce1c449e419b79c95cc7bfee19d2818b7ae5549284ff"
  license "MIT"
  version "0.1.0"

  depends_on "rust" => :build

  def install
    # Build the native messaging host
    cd "native-host" do
      system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    end

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
      WebTags native messaging host has been installed.

      To complete setup:

      1. Install the native messaging manifest for your browser:

         Chrome/Chromium:
           mkdir -p ~/.config/google-chrome/NativeMessagingHosts
           ln -sf #{prefix}/chrome-native-messaging/com.webtags.host.json \\
             ~/.config/google-chrome/NativeMessagingHosts/com.webtags.host.json

         Firefox:
           mkdir -p ~/.mozilla/native-messaging-hosts
           ln -sf #{prefix}/firefox-native-messaging/com.webtags.host.json \\
             ~/.mozilla/native-messaging-hosts/com.webtags.host.json

         Safari:
           mkdir -p ~/Library/Application\\ Support/Mozilla/NativeMessagingHosts
           ln -sf #{prefix}/safari-native-messaging/com.webtags.host.json \\
             ~/Library/Application\\ Support/Mozilla/NativeMessagingHosts/com.webtags.host.json

      2. Install the browser extension (see project README for instructions)

      3. Configure GitHub authentication in the extension settings

      The native host binary is installed at: #{bin}/webtags-host

      For more information, visit: https://github.com/adjmunro/webtags
    EOS
  end

  test do
    # Test that the binary exists and runs
    assert_match "webtags-host", shell_output("#{bin}/webtags-host --help 2>&1", 1)
  end
end
