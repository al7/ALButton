Pod::Spec.new do |s|

  s.name         = "ALButton"
  s.version      = "0.0.1"
  s.summary      = "UIButton, with some extra flavor"

  s.description  = <<-DESC
                      This control is a subclass of Apple's default UIButton. It adds some functionality,
                      cuts the number of lines needed to customize the look and behavior of the UIButton,
                      and makes use of some niceties of Swift.
                      DESC

  s.homepage     = "http://github.com/al7/ALButton"
  s.license      = "MIT"
  s.author       = { "Alex Leite" => "admin@al7dev.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/al7/ALButton.git", :tag => "0.0.1" }
  s.source_files = "ALButton/Source", "ALButton/Source/**/*.{h,m,swift}"
  s.requires_arc = true

end
