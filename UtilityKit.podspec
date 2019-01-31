#
# Be sure to run `pod lib lint UtilityKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'UtilityKit'
    s.version          = '1.0.0'
    s.summary          = 'My collection of useful extensions/classes/methods/variables'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    Description:
    TODOasdasdasdasda
    usedasdasdasdas
    asdasdasdasdasdasdasdasdasdas
    asdasdasdasdasdasdasdasdasdas
    DESC
    
    s.homepage         = 'https://github.com/dagba/UtilityKit'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Dagba' => 'Dagba' }
    s.source           = { :git => 'https://github.com/dagba/UtilityKit.git', :commit => "fae10bdcde2c3b88bc2b0398932ffea01eaa0646", :tag => s.version.to_s }
    
    
    s.ios.deployment_target = '10.0'
    s.swift_version         = '4.2'
    s.platform              = :ios, '9.0'
    s.framework         = 'UIKit'
    
    s.source_files = '*.swift'
    
    # s.resource_bundles = {
    #   'UtilityKit' => ['UtilityKit/Assets/*.png']
    # }
    
    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'
end
