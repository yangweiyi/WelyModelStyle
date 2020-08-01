#
#  Be sure to run `pod spec lint WelyModelStyle.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
s.name         = "WelyModelStyle"
s.version = "0.0.1"
s.summary      = "A nice three-party library for modal custom jumps supports ios9+ in Swift"
s.homepage     = "https://github.com/yangweiyi/WelyModelStyle"
s.license      = "MIT"
s.author       = { "yangweiyi" => "3142107409@qq.com" }
s.platform     = :ios, "9.0"
s.swift_version = "5.0"
s.source       = { :git => "https://github.com/yangweiyi/WelyModelStyle.git", :tag => "#{s.version}"  }
s.framework    = "UIKit"
s.source_files  = "ModalStyle", "ModalStyle/*.{swift}"
s.requires_arc = true
s.dependency 'SnapKit'
end
