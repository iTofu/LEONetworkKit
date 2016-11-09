Pod::Spec.new do |s|

  s.name         = "LEONetworkKit"
  s.version      = "0.0.2"
  s.summary      = "LEONetworkKit is a part of LEOKit. Support: http://LeoDev.me"
  s.homepage     = "https://github.com/iTofu/LEONetworkKit"
  s.license      = "MIT"
  s.author            = { "Leo" => "devtip@163.com" }
  s.social_media_url  = "http://LeoDev.me"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/iTofu/LEONetworkKit.git", :tag => s.version }
  s.source_files = "LEONetworkKit/**/*.{h,m}"
  s.requires_arc = true

end
