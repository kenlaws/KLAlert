#
# Be sure to run `pod lib lint KLAlert.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KLAlert'
  s.version          = '1.0.6'
  s.summary          = 'Simple one call alerts with completions in Swift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  UIAlertController is pretty cool, but it means having to write a few lines of code where before one call was often all you'd need. KLAlert is a series of static functions that let you create and handle the results of a modern alert in just one call.
                       DESC

  s.homepage         = 'https://github.com/kenlaws/KLAlert'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kenlaws' => 'pods@kenlaws.com' }
  s.source           = { :git => 'https://github.com/kenlaws/KLAlert.git', :tag => s.version.to_s }
  s.social_media_url   = "https://twitter.com/kenlaws"

  s.swift_version = '4.2'
  s.ios.deployment_target = '11.0'

  s.source_files = 'KLAlert/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KLAlert' => ['KLAlert/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
