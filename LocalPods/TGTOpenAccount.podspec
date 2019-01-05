
Pod::Spec.new do |s|

  s.name         = "TGTOpenAccount"
  s.version      = "1.0.0"
  s.summary      = "A short description of TGTOpenAccount."
  s.description  = <<-DESC
                TGT ALL Category!
                   DESC
  s.homepage     = "https://github.com/TGTloveios/TGTOpenAccount"
  s.license      = "MIT"
  s.author       = { "TGT" => "TGTloveios@163.com" }
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/TGTloveios/TGTOpenAccount.git", :tag => "1.0.0" }
  s.framework  = "UIKit"

  s.source_files  = "#{s.name}/**/*.{h,m}"
  s.resource_bundles = {
      'TGTOpenAccount' => ["#{s.name}/**/*.{xcassets}"],
  }
end
