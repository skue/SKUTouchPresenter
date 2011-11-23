# SGTouchPresenter

This class will show a large dot wherever the screen is touched. It is primarily
designed for doing presentations with a mirrored iOS device (iPhone 4S or iPad 2),
so the audience can follow the presenter's touches.

![Sample screenshot](https://raw.github.com/skue/SGTouchPresenter/master/SampleApplication/Screenshot.png)

## Usage

There's a sample project included. Basic usage:

  1. Add `SGTouchPresenter.h` & `SGTouchPresenter.m` to your project.
  2. Add the `QuartzCore` framework to your project.
  3. Call `setShowsTouchesWithColor:` when your application loads.

The `SGTouchPresenter` class will run correctly with or without ARC.

## Details

When a non-`nil` color is provided, this class intercepts touch events via
`UIApplication sendEvents:`, displaying a rounded layer wherever a touch occurs.
Events are passed on through, so it shouldn't affect your apps behavior.
There may be a small performance penalty, but only when highlighting is enabled.
When a color has not been set (or a `nil` color is provided, then the original
implementation of `UIApplication sendEvents:` is used.

## License

Copyright 2011 Scott Guelich.  
May be distributed in accordance with the MIT license.
