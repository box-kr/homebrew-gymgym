cask "gymgym" do
  version "1.1"
  sha256 "70e3cca2e07e06e0e58280ea98f767aa4ae4e3efc24b988fe3ea1972a560e460"

  url "https://github.com/box-kr/gymgym/releases/download/v#{version}/GymGym-#{version}.zip"
  name "GymGym"
  desc "macOS Menu Bar Utility for monitoring system resources and displaying animated runners"
  homepage "https://github.com/box-kr/gymgym"

  app "GymGym.app"

  # 다운로드 후 Gatekeeper에서 '손상된 앱'으로 인식되는 것을 방지합니다.
  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/GymGym.app"],
                   sudo: false,
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Preferences/com.andrew.GymGym.plist",
  ]
end
