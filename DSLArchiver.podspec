Pod::Spec.new do |s|

s.name         = "DSLArchiver"
s.version      = "1.0"
s.summary      = "数据保存方案，自动归档"
s.homepage     = "https://github.com/dengshunlai/DSLArchiver"
s.license      = "MIT"
s.author       = { "邓顺来" => "mu3305495@163.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/dengshunlai/DSLArchiver.git", :tag => "v#{s.version}" }
s.source_files = "DSLArchiver/**/*.{h,m}"
s.requires_arc = true

end

