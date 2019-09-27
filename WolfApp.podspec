Pod::Spec.new do |s|
    s.name             = 'WolfApp'
    s.version          = '2.0.4'
    s.summary          = 'Tools for working at the app- and device-level of iOS and macOS, including resources and notifications.'

    s.homepage         = 'https://github.com/wolfmcnally/WolfApp'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Wolf McNally' => 'wolf@wolfmcnally.com' }
    s.source           = { :git => 'https://github.com/wolfmcnally/WolfApp.git', :tag => s.version.to_s }

    s.swift_version = '5.0'

    s.ios.deployment_target = '9.3'
    s.ios.source_files = 'Sources/WolfApp/Shared/**/*', 'Sources/WolfApp/iOS/**/*', 'Sources/WolfApp/iOSShared/**/*', 'Sources/WolfApp/AppleShared/**/*'

    s.macos.deployment_target = '10.13'
    s.macos.source_files = 'Sources/WolfApp/Shared/**/*', 'Sources/WolfApp/macOS/**/*', 'Sources/WolfApp/AppleShared/**/*'

    s.tvos.deployment_target = '11.0'
    s.tvos.source_files = 'Sources/WolfApp/Shared/**/*', 'Sources/WolfApp/tvOS/**/*', 'Sources/WolfApp/iOSShared/**/*', 'Sources/WolfApp/AppleShared/**/*'

    s.module_name = 'WolfApp'

    s.dependency 'WolfLocale'
    s.dependency 'WolfCore'
end
