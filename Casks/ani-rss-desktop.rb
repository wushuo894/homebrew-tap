cask "ani-rss-desktop" do
  version "0.4.0"
  sha256 "9c799ca214ab84c3946055de2e4439a78a23cd066d9c94f80570f0f57f7c2136"

  url "https://github.com/wushuo894/ani-rss-desktop/releases/download/v#{version}/ani-rss-desktop-#{version}-arm64.dmg"
  name "ANI-RSS Desktop"
  desc "ANI-RSS 桌面客户端"
  homepage "https://github.com/wushuo894/ani-rss-desktop"

  # 上游目前只发布 Apple Silicon 安装包，应用要求 macOS 12 或更高版本。
  depends_on arch: :arm64, macos: :monterey

  app "ani-rss-desktop.app"
end
