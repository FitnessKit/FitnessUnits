#
# Be sure to run `pod lib lint FitnessUnits.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FitnessUnits'
  s.version          = '3.0.0'
  s.summary          = 'FitnessUnits.  Units for Fitness activity'

  s.description      = <<-DESC
FitnessUnits.  Units for Fitness activity.

Extends Foundations Units for Fitness related activity.
                       DESC

  s.homepage         = 'https://github.com/FitnessKit/FitnessUnits'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kevin A. Hoogheem' => 'kevin@hoogheem.net' }
  s.source           = { :git => 'https://github.com/FitnessKit/FitnessUnits.git', :tag => s.version.to_s }

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = '3.0'

  s.source_files = 'Sources/**/*'

end
