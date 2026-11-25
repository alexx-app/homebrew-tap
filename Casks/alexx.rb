# alexx-app/homebrew-tap 의 Casks/alexx.rb 원본.
# prod 릴리즈 워크플로(homebrew job)가 0.3.7·8f5c6ceef909bed1774b7589661b63a114de93eb0e68909cf22582649e12f548 을 채워 탭에 푸시한다 — 탭에서 직접 고치지 않는다.
cask "alexx" do
  version "0.3.7"
  sha256 "8f5c6ceef909bed1774b7589661b63a114de93eb0e68909cf22582649e12f548"

  url "https://github.com/alexx-app/alexx-release-desktop/releases/download/prd/desktop/v#{version}/Alexx_#{version}_universal.dmg"
  name "Alexx"
  desc "Tray recorder for AI transcription, speaker separation and summaries"
  homepage "https://alexx.app/"

  livecheck do
    url "https://github.com/alexx-app/alexx-release-desktop/releases/latest/download/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # 앱 내장 updater 가 스스로 갱신하므로 brew upgrade 는 --greedy 일 때만 건드린다
  auto_updates true
  depends_on macos: :ventura

  app "Alexx.app"

  uninstall quit: "app.alexx.desktop"

  # Application Support 에는 아직 업로드되지 않은 로컬 녹음도 있다 — --zap 을 명시할 때만 지운다
  zap trash: [
    "~/Library/Application Support/Alexx",
    "~/Library/Caches/app.alexx.desktop",
    "~/Library/HTTPStorages/app.alexx.desktop",
    "~/Library/HTTPStorages/app.alexx.desktop.binarycookies",
    "~/Library/LaunchAgents/Alexx.plist",
    "~/Library/Preferences/app.alexx.desktop.plist",
    "~/Library/Saved Application State/app.alexx.desktop.savedState",
    "~/Library/WebKit/app.alexx.desktop",
  ]
end
