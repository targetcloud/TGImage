Pod::Spec.new do |s|
s.name         = "TGImage"
s.version      = "0.0.2"
s.summary      = "一款以最时髦的方式来使用UIImage的swift插件"
s.homepage     = "https://github.com/targetcloud/TGImage"
s.license      = "MIT"
s.author       = { "targetcloud" => "targetcloud@163.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/targetcloud/TGImage.git", :tag => s.version }
s.source_files  = "TGImage/TGImage/TGImage/**/*.{swift,h,m}"
s.requires_arc = true
end
