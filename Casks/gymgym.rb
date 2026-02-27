cask "gymgym" do
  version "1.8"
  sha256 "ff0bfe6a4eff10a3faaa4c69725e8e96efff1ac3074a2f8e0e9b461446a47852"

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
