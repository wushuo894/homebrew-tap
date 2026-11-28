cask "rename-studio" do
  version "0.2.1"
  sha256 "01869d719063eac4562ce9e31b276b73ce53f80f73c5f25276ea23bb0ad4a0a5"

  url "https://github.com/wushuo894/rename-studio/releases/download/v#{version}/rename-studio-#{version}-arm64.dmg"
  name "Rename Studio"
  desc "批量文件重命名工具"
  homepage "https://github.com/wushuo894/rename-studio"

  # 上游的 macOS 安装包面向 Apple Silicon，最低支持 macOS 12。
  depends_on arch: :arm64, macos: :monterey

  app "rename-studio.app"
end
