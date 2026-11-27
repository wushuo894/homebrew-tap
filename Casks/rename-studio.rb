cask "rename-studio" do
  version "0.2.1"
  sha256 "3171625388bc956b487e6747b73a1d46f9f1fa7a6250b9d1f54de914e44f12dc"

  url "https://github.com/wushuo894/rename-studio/releases/download/v#{version}/rename-studio-#{version}-arm64.dmg"
  name "Rename Studio"
  desc "批量文件重命名工具"
  homepage "https://github.com/wushuo894/rename-studio"

  # 上游的 macOS 安装包面向 Apple Silicon，最低支持 macOS 12。
  depends_on arch: :arm64, macos: :monterey

  app "rename-studio.app"
end
