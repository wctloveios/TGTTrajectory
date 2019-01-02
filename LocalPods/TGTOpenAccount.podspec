
Pod::Spec.new do |s|

  s.name         = "TGTOpenAccount"
  s.version      = "1.0.0"
  s.summary      = "A short description of TGTOpenAccount."
  s.description  = <<-DESC
                WCT ALL Category!
                   DESC
  s.homepage     = "https://github.com/wctloveios/TGTOpenAccount"
  s.license      = "MIT"
  s.author       = { "wct" => "wctloveios@163.com" }
  s.platform     = :ios, "8.0"

  s.source_files  = "#{s.name}/**/*.{h,m}"
  s.source       = { :git => "https://github.com/wctloveios/TGTOpenAccount.git", :tag => "1.0.0" }
  s.framework  = "UIKit"

  s.source_files  = "{s.name/*.{h，m}}"

end
