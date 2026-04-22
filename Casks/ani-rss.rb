cask "ani-rss" do
  version "3.1.0"

  url "https://github.com/wushuo894/ani-rss/releases/download/v#{version}/ani-rss.dmg"
  sha256 "4a00982634bd24838c977af3448a13feb63a823b5cf7573690bdacae2c8dbeee"

  name "ani-rss"
  desc "基于RSS自动追番、订阅、下载、刮削"
  homepage "https://github.com/wushuo894/ani-rss"

  auto_updates true

  app "ani-rss.app"

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