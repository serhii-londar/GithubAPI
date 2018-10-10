#
# Be sure to run `pod lib lint GithubAPI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GithubAPI'
  s.version          = '0.0.6'
  s.summary          = 'Swift implementation of Github REST api v3'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Swift implementation of Github REST api v3. Library support swift 4.0. Work is in progress. Currently supported: Issues, Notification, Repositories, Search, and User API's.
                       DESC

  s.homepage         = 'https://github.com/serhii-londar/GithubAPI'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Serhii Londar' => 'serhii.londar@gmail.com' }
  s.source           = { :git => 'https://github.com/serhii-londar/GithubAPI.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/serhii_londar'

  s.ios.deployment_target = '9.0'

  s.source_files = 'GithubAPI/Classes/**/*'

  s.frameworks = 'Foundation'

  s.dependency 'BaseAPI'
end
