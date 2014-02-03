Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name         = "SGTouchPresenter"
  s.version      = "1.2"
  s.summary      = "Shows a dot wherever the screen is touched"

  s.description  = <<-DESC
                   SGTouchPresenter shows a large dot wherever the screen is touched.
                   This is primarily designed for doing presentations with a mirrored device,
                   so the audience can follow the presenter’s touches.

                   The color of the dot is customizable, and you can optionally configure
                   SGTouchPresenter to only display touches when mirroring is enabled.
                   DESC

  s.homepage     = "https://github.com/skue/SGTouchPresenter"
  s.screenshots  = "https://raw.github.com/skue/SGTouchPresenter/master/SampleApplication/Screenshot.png"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.license      = 'MIT'
  s.author       = { "Scott Guelich" => "scott@guelich.net" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.platform     = :ios

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source       = { :git => "https://github.com/skue/SGTouchPresenter", :tag => "1.2.0" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files  = 'SGTouchPresenter.{h,m}'
  s.exclude_files = 'SampleApplication'


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.framework  = 'QuartzCore'

end

