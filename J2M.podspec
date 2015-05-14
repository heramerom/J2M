#
#  Be sure to run `pod spec lint HPDCodeCollection.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
    s.name         = "J2M"
    s.version      = "0.0.1"
    s.summary      = "A simple Dictionary/Array to Model library"
    s.homepage     = "https://github.com/heramerom/J2M"
    s.license      = "BSD"
    s.author             = { "Heramerom" => "Heramerom@163.com" }
    s.source       = { :git => "https://github.com/heramerom/J2M.git", :tag => "0.0.1" }
    s.source_files  = "J2M/J2M/*.{h,m}"
    s.platform = :ios
    s.ios.deployment_target = '7.0'
    s.frameworks = 'Foundation'
    s.requires_arc = true
end