Pod::Spec.new do |s|
  s.name         = "TGTCategoty"
  s.version      = "1.0.0"
  s.summary      = s.name
  s.description  = s.name
  s.homepage     = "http://EXAMPLE/IMSHUD"
  s.platform     =  :ios, '8.0'
  s.license = {
    :type => 'Copyright',
    :text => <<-LICENSE
              Alibaba-Inc copyright
    LICENSE
    }
  s.author             = { "jianhuaqiao.qjh" => "jianhuaqiao.qjh@alibaba-inc.com" }
  s.source       =  { 'path' => s.name }
  s.source_files  = "#{s.name}/**/*.{h,m}"

end
