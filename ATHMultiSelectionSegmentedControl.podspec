Pod::Spec.new do |s|
  s.name             = 'ATHMultiSelectionSegmentedControl'
  s.version          = '0.1.1'
  s.summary          = 'A control mimicking UISegmentedControl behaviour but allowing for multiple segment selection'

  s.description      = <<-DESC
ATHMultiSelectionSegmentedControl is a UIView based control that mimicks UISegmentedControl's API but also allows for multiple segment selection. It's battle tested and fully tested. If you find any bugs or want to suggest improvements please feel free to contribute.'
                       DESC

  s.homepage         = 'https://github.com/attheodo/ATHMultiSelectionSegmentedControl'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'attheodo' => 'at@atworks.gr' }
  s.source           = { :git => 'https://github.com/attheodo/ATHMultiSelectionSegmentedControl.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/attheodo'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ATHMultiSelectionSegmentedControl/Classes/**/*'

  s.frameworks = 'UIKit', 'Foundation', 'QuartzCore'

end
