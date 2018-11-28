Pod::Spec.new do |s|
    s.name             = 'WolfApp'
    s.version          = '1.0.3'
    s.summary          = 'Tools for working at the app- and device-level of iOS and macOS, including resources and notifications.'

    s.homepage         = 'https://github.com/wolfmcnally/WolfApp'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Wolf McNally' => 'wolf@wolfmcnally.com' }
    s.source           = { :git => 'https://github.com/wolfmcnally/WolfApp.git', :tag => s.version.to_s }

    s.swift_version = '4.2'

    s.ios.deployment_target = '9.3'
    s.ios.source_files = 'WolfApp/Classes/Shared/**/*', 'WolfApp/Classes/iOS/**/*', 'WolfApp/Classes/iOSShared/**/*', 'WolfApp/Classes/AppleShared/**/*'

    s.macos.deployment_target = '10.13'
    s.macos.source_files = 'WolfApp/Classes/Shared/**/*', 'WolfApp/Classes/macOS/**/*', 'WolfApp/Classes/AppleShared/**/*'

    s.tvos.deployment_target = '11.0'
    s.tvos.source_files = 'WolfApp/Classes/Shared/**/*', 'WolfApp/Classes/tvOS/**/*', 'WolfApp/Classes/iOSShared/**/*', 'WolfApp/Classes/AppleShared/**/*'

    s.module_name = 'WolfApp'

    s.dependency 'WolfLocale'
    s.dependency 'WolfFoundation'
    s.dependency 'WolfConcurrency'
    s.dependency 'WolfAnimation'
    s.dependency 'WolfOSBridge'
end
