cask "ani-rss" do
  version "3.2.53"

  url "https://github.com/wushuo894/ani-rss/releases/download/v#{version}/ani-rss.dmg"
  sha256 "d1aa0fe892979e8f6d99e9c0d709b245e217b8a3317dfef9581662e6e58cdad2"

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
