

Pod::Spec.new do |s|
  s.name             = 'MLUIKit'
  s.version          = '0.1.0'
  s.summary          = 'A short description of MLUIKit.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/<GITHUB_USERNAME>/MLUIKit'
 
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '梁卫' => '509070768.com' }
  s.source           = { :git => 'https://git.coding.net/danwey/MLUIKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'MLUIKit/**/*.{h,m}'
  s.resources = ['MLUIKit/Resources/*.{png,xml,plist,bundle,xcassets,storyboard,xib,xcdatamodeld}','MLUIKit/**/*.{xcdatamodeld}']
  
  s.prefix_header_contents = '#import "MLUIKit.h"'

  s.frameworks = 'UIKit', 'MapKit','CoreData'
  s.static_framework = true
  s.resource_bundles = {
     'MLUIKit' => ['MLUIKit/**/*.{png,json,xml,plist,bundle,xcassets,storyboard,xib,xcdatamodeld,lproj}','MLUIKit/**/*.{xcdatamodeld}']
  }

end
