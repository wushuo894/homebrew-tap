cask "ani-rss" do
  version "3.1.6"

  url "https://github.com/wushuo894/ani-rss/releases/download/v#{version}/ani-rss.dmg"
  sha256 "aaacf84fa84e7b11ffcc12ba722a6ce5691899c893a9be796895b8ed9af31952"

  name "ani-rss"
  desc "基于RSS自动追番、订阅、下载、刮削、洗版"
  homepage "https://docs.wushuo.top/"

  depends_on macos: ">= :big_sur"
  auto_updates true

  app "ani-rss.app"

  caveats do
      depends_on_java "17+"
      unsigned_accessibility
  end

  postflight do
      # 设置应用程序权限
      system_command '/bin/chmod',
                      args: ['-R', '755', "#{appdir}/ani-rss.app"],
                      sudo: false

      # 移除隔离属性（解决"文件已损坏"问题）
      system_command '/usr/bin/xattr',
                     args: ['-cr', "#{appdir}/ani-rss.app"],
                     sudo: false

      # 验证权限
      puts "✅ 权限已设置"
      system "ls -ld #{appdir}/ani-rss.app"
  end
end