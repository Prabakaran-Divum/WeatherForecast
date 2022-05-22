# Uncomment the next line to define a global platform for your project
# platform :ios, '14.0'
use_frameworks!

def static_pods
  pod 'SwiftLint'
  pod 'Alamofire', '~> 4.7'
  pod 'lottie-ios'
  pod 'Toast-Swift', '~> 5.0.1'
end

target 'WeatherForecast' do
  # Comment the next line if you don't want to use dynamic frameworks
  static_pods

  target 'WeatherForecastTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'WeatherForecastUITests' do
    # Pods for testing
  end

end
