cask "ani-rss" do
  version "3.2.31"

  url "https://github.com/wushuo894/ani-rss/releases/download/v#{version}/ani-rss.dmg"
  sha256 "4534b78701b1cd99b8f6fb9eb669cccb159a3fb3a7e6b072e11cd3a324de40e9"

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
