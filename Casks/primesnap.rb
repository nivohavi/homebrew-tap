cask "primesnap" do
  version "0.1.1"
  sha256 "02b543309e30d955da06e9c33a5eab24a983e216f1d514a8478be8249aac8688"

  url "https://github.com/nivohavi/primesnap/releases/download/v#{version}/PrimeSnap.dmg"
  name "PrimeSnap"
  desc "Menu bar app to capture, frame, annotate and redact screenshots"
  homepage "https://github.com/nivohavi/primesnap"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "PrimeSnap.app"

  zap trash: [
    "~/Library/Application Support/PrimeSnap",
    "~/Library/Preferences/io.github.nivohavi.primesnap.plist",
  ]

  caveats <<~EOS
    PrimeSnap is not notarized by Apple. If macOS blocks it on first launch,
    right-click the app and choose Open, or run:
      xattr -dr com.apple.quarantine /Applications/PrimeSnap.app
    Then allow Screen Recording in System Settings › Privacy & Security.
  EOS
end
