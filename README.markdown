# SGTouchPresenter

This class will show a large dot wherever the screen is touched. The color is
customizable. This is primarily designed for doing presentations with a mirrored
iOS device (iPhone 4S/iPad 2 or later), so the audience can follow the presenter's
touches.

![Sample screenshot](https://raw.github.com/skue/SGTouchPresenter/master/SampleApplication/Screenshot.png)


## Usage

### The Easy Way

There's a sample project included. Basic usage:

  1. Add `SGTouchPresenter.h` & `SGTouchPresenter.m` to your project.
  2. Add the `QuartzCore` framework to your project.
  3. Call `showTouchesWithColor:` or `showTouchesWithColor:onlyWhenMirrored:` after your application loads.

The SGTouchPresenter class works with or without ARC.

### The Less Easy Way

The easy way may not get through App Store approval. If you need that, then you
just need to add SGTouchPresenter as a subclass `UIApplication`. Here's how to do that:

  1. Add `SGTouchPresenter.h` & `SGTouchPresenter.m` to your project.
  2. Add the `QuartzCore` framework to your project.
  3. Open `SGTouchPresenter.m` and delete the two blocks of code that say "Delete if subclassing...".
     This isn't necessary to make it work, it just removes the code that Apple might not approve.
  4. Edit `main.m` to add `@"SGTouchPresenter"` as the third argument to `UIApplicationMain`.
  5. Call `showTouchesWithColor:` or `showTouchesWithColor:onlyWhenMirrored:` after your application loads.

### Custom UIApplication Subclass

Either way, if you already use a custom subclass of `UIApplication` then you
should change the superclass of `SGTouchPresenter.h` from `UIApplication` to your
the name of your custom subclass.


## API

`+ (void) setShowsTouchesWithColor: (UIColor *)color`

When a  color is provided, touches will be shown. Passing `nil` will turn it off.

`+ (void) showTouchesWithColor: (UIColor *)color onlyWhenMirrored: (BOOL)dynamic`

This will automatically show touches whenever another screen is connected,
and stop showing touches when the screen is disconnected. Passing a `nil`
color will disable the behavior and stop tracking the number of screens.


## Implementation Details

When enabled, the class intercepts touch events via `UIApplication sendEvents:`,
displaying a dot wherever a touch occurs.  Events are passed onward, so this
shouldn't affect your app's behavior.

In order to intercept events via `UIApplication sendEvents:`, you typically
subclass `UIAppliation`. But if you follow "The Easy Way", then the code uses
isa swizzling to dynamically provide this functionality.


## License

Copyright 2011-2012 Scott Guelich.  
May be distributed in accordance with the MIT license.
