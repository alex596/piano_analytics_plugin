#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint piano_analytics_plugin.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'piano_analytics_plugin'
  s.version          = '0.0.1'
  s.summary          = 'A flutter plugin for use piano anlaytics.'
  s.description      = <<-DESC
A flutter plugin for use piano anlaytics.
                       DESC
  s.homepage         = 'https://github.com/alex596/piano_analytics_plugin'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Personal' => 'alexis.louis042@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'PianoAnalytics/iOS', '>=3.1'
  s.platform = :ios, '14.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
