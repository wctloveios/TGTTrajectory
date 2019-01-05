
Pod::Spec.new do |s|

  s.name         = "WCTAllCategory"
  s.version      = "1.0.2"
  s.summary      = "A short description of WCTAllCategory."
  s.description  = <<-DESC
                WCT ALL Category!
                   DESC
  s.homepage     = "https://github.com/wctloveios/WCTAllCateGory"
  s.license      = "MIT"
  s.author       = { "wct" => "wctloveios@163.com" }
  s.platform     = :ios, "8.0"

  s.source_files  = "#{s.name}/**/*.{h,m}"
  s.source       = { :git => "https://github.com/wctloveios/WCTAllCateGory.git", :tag => "1.0.2" }
  s.framework  = "UIKit"

  s.source_files  = "#{s.name}/**/*.{h,m}"
 
end
