Pod::Spec.new do |s|

  s.name         = "UIGuard"
  s.version      = "0.1"
  s.summary      = "A tiny tool to guarantee that the UI is running within the main thread."
  s.homepage     = "https://github.com/huayu0723/UIGuard"
  s.license      = "MIT"
  s.author       = {
                    "huazhenyu" => "zhyhua04@gmail.com",
  }
  s.source        = { :git => "https://github.com/huayu0723/UIGuard.git", :tag => s.version.to_s }
  s.source_files  = "*.{h,m}"
  s.requires_arc  = true

  s.private_header_files = "UIGuard.h"

  s.ios.deployment_target = "7.0"

  s.dependency "Aspects"
end