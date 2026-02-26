cask "receptacle" do
  version "0.0.1"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/adjmunro/swift-receptacle/releases/download/v#{version}/Receptacle-#{version}.dmg"

  name "Receptacle"
  desc "Unified communications hub — email, RSS, and messaging"
  homepage "https://github.com/adjmunro/swift-receptacle"

  app "Receptacle.app"

  zap trash: [
    "~/Library/Containers/com.user.receptacle",
    "~/Library/Application Support/Receptacle",
    "~/Library/Preferences/com.user.receptacle.plist",
    "~/Library/LaunchAgents/com.user.receptacle.updater.plist",
  ]
end