Pod::Spec.new do |s|
  s.name         = "BIZCircularTransition"
  s.version      = '1.0.1'
  s.summary      = "BIZCircularTransition is a round transition between UIViewControllers."
  s.homepage     = "https://github.com/bizibizi/BIZCircularTransition"
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "Igor Bizi" => "igorbizi@mail.ru" }
  s.platform              = :ios, '7.0'
  s.source       = { :git => "https://github.com/bizibizi/BIZCircularTransition.git", :tag => '1.0.2' }
  s.source_files          = 'Classes/*.{h,m}'
  s.public_header_files   = 'Classes/*.h'
  s.frameworks            = 'UIKit', 'Foundation'
  s.requires_arc          = true
end