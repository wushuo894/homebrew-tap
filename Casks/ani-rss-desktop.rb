cask "ani-rss-desktop" do
  version "0.6.0"
  sha256 "4b8b2f8e2e452d244df804958c6b2ffe19af9ee13f06705d81e784ef6303832c"

  url "https://github.com/wushuo894/ani-rss-desktop/releases/download/v#{version}/ani-rss-desktop-#{version}-arm64.dmg"
  name "ANI-RSS Desktop"
  desc "ANI-RSS 桌面客户端"
  homepage "https://github.com/wushuo894/ani-rss-desktop"

  # 上游目前只发布 Apple Silicon 安装包，应用要求 macOS 12 或更高版本。
  depends_on arch: :arm64, macos: :monterey

  app "ani-rss-desktop.app"
end
