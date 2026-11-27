cask "ani-rss-desktop" do
  version "0.6.1"
  sha256 "56d20544de9310bf33df2f36408c0fc5bf83ecf73651447b65231f4bb0156264"

  url "https://github.com/wushuo894/ani-rss-desktop/releases/download/v#{version}/ani-rss-desktop-#{version}-arm64.dmg"
  name "ANI-RSS Desktop"
  desc "ANI-RSS 桌面客户端"
  homepage "https://github.com/wushuo894/ani-rss-desktop"

  # 上游目前只发布 Apple Silicon 安装包，应用要求 macOS 12 或更高版本。
  depends_on arch: :arm64, macos: :monterey

  app "ani-rss-desktop.app"
end
