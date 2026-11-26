cask "ani-rss-desktop" do
  version "0.3.0"
  sha256 "6a7f36026a69e39d98c0d735cd3a4ae78deb89118a4721f9e12ca2ec3d65d539"

  url "https://github.com/wushuo894/ani-rss-desktop/releases/download/v#{version}/ani-rss-desktop-#{version}-arm64.dmg"
  name "ANI-RSS Desktop"
  desc "ANI-RSS 桌面客户端"
  homepage "https://github.com/wushuo894/ani-rss-desktop"

  # 上游目前只发布 Apple Silicon 安装包，应用要求 macOS 12 或更高版本。
  depends_on arch: :arm64, macos: ">= :monterey"

  app "ani-rss-desktop.app"
end
