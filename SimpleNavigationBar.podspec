Pod::Spec.new do |s|
  s.name         = "SimpleNavigationBar"
  s.version      = "0.0.2"
  s.summary      = "easy use NavigationBar"
  s.homepage         = "https://github.com/ChendayUP/SimpleNavigationBar"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "ChenDayUP" => "705285647@qq.com" }
  s.source       = { :git => "https://github.com/ChendayUP/SimpleNavigationBar.git", :tag => "#{s.version}" }
  s.source_files  = "Source/*.swift"
  s.requires_arc     = true
  s.ios.deployment_target = "8"
  s.description  = "easy use NavigationBar" 
  s.module_name = 'SimpleNavigationBar'
end
