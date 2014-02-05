Pod::Spec.new do |s|
  s.name         = "SGTouchPresenter"
  s.version      = "1.2.1"
  s.summary      = "Highlight touches on screen, useful for iOS demos"
  s.description  = <<-DESC
                   SGTouchPresenter allows you to demo your app to an audience and have
                   them follow your touches. It displays a dot (or multiple dots) wherever
                   the screen is touched. You can configure the dot's color and opacity,
                   and you can also have the dot(s) appear only when the device is
                   mirroring to a second display via AirPlay or an adapter cable.
                   DESC
  s.homepage     = "https://github.com/skue/SGTouchPresenter"
  s.screenshots  = "https://raw.github.com/skue/SGTouchPresenter/master/SampleApplication/Screenshot.png"
  s.license      = 'MIT'
  s.author       = { "Scott Guelich" => "scott@guelich.net" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/skue/SGTouchPresenter.git", :tag => "1.2.1" }
  s.source_files  = 'SGTouchPresenter.{h,m}'
  s.exclude_files = 'SampleApplication'
  s.framework  = 'QuartzCore'
end

