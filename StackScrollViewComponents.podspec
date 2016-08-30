#
# Be sure to run `pod lib lint StackScrollViewComponents.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StackScrollViewComponents'
  s.version          = '0.1.0'
  s.summary          = 'A short description of StackScrollViewComponents.'
  s.homepage         = 'https://github.com/muukii/StackScrollViewComponents'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'muukii' => 'm@muukii.me' }
  s.source           = { :git => 'https://github.com/muukii/StackScrollViewComponents.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/muukii0803'

  s.ios.deployment_target = '8.0'

  s.source_files = 'StackScrollViewComponents/Classes/**/*'
  s.dependency 'StackScrollView'
end
