#
# Be sure to run `pod lib lint PickerPopupDialog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PickerPopupDialog'
  s.version          = '0.1.0'
  s.summary          = 'Display a Picker inside a Popup Dialog. It also gives you the ability to separate displayed text from values'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  PickerPopupDialog is a a popup iOS picker control written in Swift 4. It lets you input any type of data in the format [(Any, String)].
                       DESC

  s.homepage         = 'https://github.com/ribasal1/PickerPopupDialog'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ribasal1' => 'github@linkmedia.ch' }
  s.source           = { :git => 'https://github.com/ribasal1/PickerPopupDialog.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/LinkMedia_ch'

  s.ios.deployment_target = '10.0'

  s.source_files = 'PickerPopupDialog/Classes/**/*'
  
  s.swift_version = '4.0'
  
  # s.resource_bundles = {
  #   'PickerPopupDialog' => ['PickerPopupDialog/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
