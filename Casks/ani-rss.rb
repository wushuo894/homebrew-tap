cask "ani-rss" do
  version "3.2.57"

  url "https://github.com/wushuo894/ani-rss/releases/download/v#{version}/ani-rss.dmg"
  sha256 "60c4bb990b204b72b99bab7c1d69a3e131fc12170cd4ab57525772e9a7889196"

  name "ani-rss"
  desc "基于RSS自动追番、订阅、下载、刮削、洗版"
  homepage "https://docs.wushuo.top/"

  depends_on macos: :big_sur
  auto_updates true

  app "ani-rss.app"

  caveats do
      depends_on_java "17+"
      unsigned_accessibility
  end
end
