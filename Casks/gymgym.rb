cask "gymgym" do
  version "1.23"
  sha256 "9fc7a3e9d3d7549a5b9a40ec15bd041cfed034d9929fda6f0fd342285ecf5015"

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
    "~/Library/Preferences/kr.box.macos.GymGym.plist",
  ]
end
