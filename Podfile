platform :ios, '14.0'
use_frameworks!

# Define shared library for all target.
def common_pods
  pod 'SnapKit'
  pod 'R.swift'
  pod 'Firebase/Analytics'
  pod 'Firebase/Crashlytics'
  pod 'Firebase'
  pod 'Firebase/RemoteConfig'
  pod 'CoreLocation'
  pod 'Alamofire'
  
end

target 'BaseProjectApp' do
  inhibit_all_warnings!
  
  common_pods
   
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '5.0'
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
        if config.base_configuration_reference.is_a? Xcodeproj::Project::Object::PBXFileReference
          xcconfig_path = config.base_configuration_reference.real_path
          IO.write(xcconfig_path, IO.read(xcconfig_path).gsub("DT_TOOLCHAIN_DIR", "TOOLCHAIN_DIR"))
        end
      end
    end
  end
end
