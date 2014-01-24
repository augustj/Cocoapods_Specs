Pod::Spec.new do |s|

  s.name         = "opentok-ios-sdk-webrtc"
  s.version      = "2.1.7"
  s.summary      = "A podspec that wraps the OpenTok iOS WebRTC SDK"

  s.description  = <<-DESC
                   Don't you wish you could still run the simulator with the OpenTok iOS WebRTC SDK?

                   * Now you can!  The opentok lib will only be linked against for arm architectures.
                   * Simple wrap your opentok code up in something like a service with a protocol. 
                   * Then write a second dummy implementation that conforms to the protocol and load that when running on the simulator.
                   DESC

  s.homepage     = "http://github.com/augustj"
 
  s.license      = 'MIT (example)'
  

  s.author       = { "August Jaenicke" => "august@carbonfive.com" }
  # s.authors      = { "August Jaenicke" => "august@carbonfive.com"}
  # s.author       = 'August Jaenicke'

  s.platform     = :ios, '6.1'

  s.source       = { :git => "https://github.com/opentok/opentok-ios-sdk-webrtc.git", :tag => "2.1.7" }

  s.source_files  = 'Opentok.framework/Versions/A/Headers/*'
  s.preserve_paths = 'Opentok.framework/*'

  other_frameworks =  ['Opentok', 'AudioToolbox', 'AVFoundation', 'CFNetwork', 'CoreAudio', 'CoreMedia', 'CoreTelephony', 'CoreVideo', 'MobileCoreServices', 'OpenGLES', 'QuartzCore', 'Security', 'SystemConfiguration']
  
  other_ldflags = '$(inherited) -framework ' + other_frameworks.join(' -framework ') + ' -lz -lstdc++'
  
  s.xcconfig     = { 
    'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/opentok-ios-sdk-webrtc"',

    'OTHER_LDFLAGS[arch=arm64]' => other_ldflags,
    'OTHER_LDFLAGS[arch=armv7]' => other_ldflags,
    'OTHER_LDFLAGS[arch=armv7s]' => other_ldflags
  }

  s.exclude_files = 'Opentok.framework/Versions/A/Resources/Info.plist'

  s.resources = ['Opentok.framework/Versions/A/Resources/*']
end
