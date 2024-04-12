source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!

def testing_pods
  pod 'Quick', '7.3.0'
  pod 'Nimble', '12.3.0'
end

def app_pods
  # UI
  pod 'SDWebImage', '5.18.2'
  pod 'SkeletonView', '1.30.4'

  # Network
  pod 'Alamofire', '5.8.0'

  # Local Storage
  pod 'KeychainAccess', '4.2.2'

  # Tools
  pod 'Firebase/Crashlytics', '10.15.0'
  pod 'IQKeyboardManagerSwift', '6.5.12'

  # Development
end

target 'iOSTemplates' do

  app_pods

  target 'iOSTemplatesTests' do
    inherit! :search_paths
    testing_pods
  end

  target 'iOSTemplatesUITests' do
    testing_pods
  end
end

post_install do |installer|

    installer.pods_project.build_configurations.each do |config|
        config.build_settings["GENERATE_INFOPLIST_FILE"] = 'YES'
    end

    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        end
    end
end
