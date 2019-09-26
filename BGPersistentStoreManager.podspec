Pod::Spec.new do |s|
  s.name             = "BGOpaqueLabel"
  s.version          = "1.0.0"
  s.homepage         = "https://github.com/benguild/BGOpaqueLabel"
  s.summary          = "An opaque, non-blended label for `UIKit` on iOS with full Emoji support."
  s.license          = 'MIT'
  s.author           = { "Ben Guild" => "hello@benguild.com" }
  s.source           = { :git => "https://github.com/benguild/BGOpaqueLabel.git", :tag => s.version.to_s }
  s.source_files     = 'BGOpaqueLabel.{h,m}'
  s.social_media_url = 'https://twitter.com/benguild'

  s.platform     = :ios, '8.0'
  s.requires_arc = true
end
