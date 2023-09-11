#
# Be sure to run `pod lib lint SDKNetwork.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SDKNetwork'
  s.version          = '0.1.0'
  s.summary          = 'A short description of SDKNetwork.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
<<<<<<< HEAD
TODO: Add long description of the pod here.
=======
TODO: Network SDK.
>>>>>>> master
                       DESC

  s.homepage         = 'https://github.com/Lillian-sg/SDKNetwork'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Lillian-sg' => 'souza.lillian@gmail.com' }
  s.source           = { :git => 'https://github.com/Lillian-sg/SDKNetwork.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

<<<<<<< HEAD
  s.ios.deployment_target = '10.0'
=======
  s.ios.deployment_target = '9.0'
>>>>>>> master

  s.source_files = 'SDKNetwork/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SDKNetwork' => ['SDKNetwork/Assets/*.png']
  # }

<<<<<<< HEAD
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
=======
   s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'MapKit'
>>>>>>> master
  # s.dependency 'AFNetworking', '~> 2.3'
end
