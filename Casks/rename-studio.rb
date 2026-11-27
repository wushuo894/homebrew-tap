cask "rename-studio" do
  version "0.2.0"
  sha256 "6634057ac031554bc8d618066af817e2c0f1f313b018a3d9e37baf8ac55f97f3"

  url "https://github.com/wushuo894/rename-studio/releases/download/v#{version}/rename-studio-#{version}-arm64.dmg"
  name "Rename Studio"
  desc "批量文件重命名工具"
  homepage "https://github.com/wushuo894/rename-studio"

  # 上游的 macOS 安装包面向 Apple Silicon，最低支持 macOS 12。
  depends_on arch: :arm64, macos: :monterey

  app "rename-studio.app"
end
