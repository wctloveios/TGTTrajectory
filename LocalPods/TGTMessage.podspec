Pod::Spec.new do |s|
  s.name         = "TGTMessage"
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
  s.author             = { "wctloveios" => "wctloveios@163.com" }
  s.source       =  { 'path' => s.name }
  s.source_files  = "#{s.name}/**/*.{h,m}"

end
