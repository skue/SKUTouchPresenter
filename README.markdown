# SKUTouchPresenter

SKUTouchPresenter allows you to demo your app to an audience and have
them follow your touches. It displays a dot (or multiple dots) wherever
the screen is touched. You can configure the dot's color and opacity,
and you can also have the dot(s) appear only when the device is
mirroring to a second display via AirPlay or an adapter cable.

A sample app is included, which allows you to turn dots on & off and
customize the color/opacity:

![](https://raw.github.com/skue/SKUTouchPresenter/master/SampleApplication/Screenshot.png)


## Integration

**With Cocoapods:**

  1. Add SKUTouchPresenter to your Podfile, and run `pod install`.

**Manually (without Cocoapods):**

  1. Add the `SKUTouchPresenter.h` & `SKUTouchPresenter.m` files to your project.
  2. Add the `QuartzCore` system framework to your project.

**Important:** if you already use a custom subclass of `UIApplication`, then you
should edit `SKUTouchPresenter.h` and change the superclass from `UIApplication` to
the name of your custom subclass (so the inheritance chain is `UIApplication`
-> `YourApplicationSubclass` -> `SKUTouchPresenter`).


## Usage

Call `showTouchesWithColor:` or `showTouchesWhenMirroringWithColor:` in your
application delegate, or whenever you want to start showing touches.

`+ (void) showTouchesWithColor: (UIColor *)color`

> Enables (or disables) showing dots wherever the screen is touched.
> Pass `nil` to disable.

`+ (void) showTouchesWhenMirroringWithColor: (UIColor *)color`

> Enables (or disables) showing dots wherever the screen is touched, but
> only when the device is mirroring to a second display.

`+ (void) setTouchRadius: (CGFloat)radius`

> Sets the radius of the dot in pixels. The default is 20 pixels.

The SKUTouchPresenter class works with or without ARC.


## Implementation Details

When enabled, the class intercepts touch events via `UIApplication sendEvents:`,
displaying a dot wherever a touch occurs. Events are passed onward, so this
shouldn't affect your app's behavior.

In order to intercept events via `UIApplication sendEvents:`, you typically
subclass `UIAppliation`. By default, the code uses [dynamic subclassing][1]
to do this automatically the first time you call `showTouchesWithColor:` or
`showTouchesWhenMirroringWithColor`. This enables you to wrap these
calls with `#define` blocks and only include the functionality for particular builds.

SKUTouchPresenter does not use any private APIs and should be fine for App Store approval.
However, you can set it up manually without the dynamic subclassing: you just need to
add SKUTouchPresenter as a custom subclass of `UIApplication`. Here's how to do that:

  1. Follow the integration steps above.
  1. Edit `main.m` to add `@"SKUTouchPresenter"` as the third argument to `UIApplicationMain`.
  2. If your app already uses a custom subclass of `UIApplication` then please see the
     notes about custom subclasses in the Usage section.
  2. If you want to delete the dynamic subclassing code to be extra paranoid, open
     `SKUTouchPresenter.m` and delete the two blocks of code that say "Can delete if subclassing...".

[1]: https://developer.apple.com/library/ios/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/object_setClass

## License

Copyright 2011-2014 Scott Guelich.
May be distributed in accordance with the MIT license.

