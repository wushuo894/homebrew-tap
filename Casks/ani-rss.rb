cask "ani-rss" do
  version "3.2.61"

  url "https://github.com/wushuo894/ani-rss/releases/download/v#{version}/ani-rss.dmg"
  sha256 "8931cd62722d1217e2b66ea352df5e3ea97d554e4f6e8f848abd07933f826542"

  name "ani-rss"
  desc "基于RSS自动追番、订阅、下载、刮削、洗版"
  homepage "https://docs.wushuo.top/"

  # 旧版 macOS Cask 自该日期起弃用。
  deprecate! date: "2026-11-27", because: "the legacy macOS package is deprecated",
             replacement_cask: "wushuo894/tap/ani-rss-desktop"

  depends_on macos: :big_sur
  auto_updates true

  app "ani-rss.app"

  caveats do
      depends_on_java "17+"
      unsigned_accessibility
  end
end
