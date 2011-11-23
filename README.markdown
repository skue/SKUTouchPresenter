# SGTouchPresenter

This class will show a large dot wherever the screen is touched. The color is
customizable. This is primarily designed for doing presentations with a mirrored
iOS device (iPhone 4S or iPad 2), so the audience can follow the presenter's touches.

![Sample screenshot](https://raw.github.com/skue/SGTouchPresenter/master/SampleApplication/Screenshot.png)

## Usage

There's a sample project included. Basic usage:

  1. Add `SGTouchPresenter.h` & `SGTouchPresenter.m` to your project.
  2. Add the `QuartzCore` framework to your project.
  3. Call `setShowsTouchesWithColor:` when your application loads.

The SGTouchPresenter class functions correctly with or without ARC.

## Details

`+ (void) setShowsTouchesWithColor: (UIColor *)color`

When a  color is provided, this class begins intercepting touch events via
`UIApplication sendEvents:`, displaying a rounded layer wherever a touch occurs.
Events are passed onward, so this shouldn't affect your apps behavior,
though there may be a small performance penalty.

When a color has not been set (or a `nil` color is provided), then the original
implementation of `UIApplication sendEvents:` is used.

## License

Copyright 2011 Scott Guelich.  
May be distributed in accordance with the MIT license.
