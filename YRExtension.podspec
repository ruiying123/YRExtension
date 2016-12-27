
Pod::Spec.new do |s|

  s.name         = "YRExtension"
  s.version      = "0.0.2"
  s.summary      = "A Sample Extension of Swift."

  s.homepage     = "https://github.com/ruiying123/YRExtension.git"
  s.license      = "MIT"
  s.author       = { "yangrui" => "1075551032@qq.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/ruiying123/YRExtension.git", :tag => "0.0.2" }

  s.source_files  = "YRExtension", "YRExtension/Class/*.{h,m}"

end
