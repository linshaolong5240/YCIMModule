#
# Be sure to run `pod lib lint YCIMModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YCIMModule'
  s.version          = '0.1.0'
  s.summary          = 'A short description of YCIMModule.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/linshaolong5240/YCIMModule'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'linshaolong5240' => '634205468@qq.com' }
  s.source           = { :git => 'https://github.com/linshaolong5240/YCIMModule.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'YCIMModule/Classes/**/*'
#  s.default_subspec = 'All'
#
#  s.subspec "Core" do |core|
#      core.source_files = 'YCIMModule/Classes/Core/**/*'
#      core.private_header_files = 'YCMapKitModule/Classes/Core/**/*.h'
#  end
#
#  s.subspec "OneCar" do |onecar|
#      onecar.source_files = 'YCIMModule/Classes/OneCar/**/*'
#      onecar.private_header_files = 'YCMapKitModule/Classes/OneCar/**/*.h'
#      onecar.dependency = "YCIMModule/Core"
#  end
#
#  s.subspec 'All' do |all|
#      all.dependency "YCIMModule/Core"
#      all.dependency "YCIMModule/OneCar"
#  end

  # s.resource_bundles = {
  #   'YCIMModule' => ['YCIMModule/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
