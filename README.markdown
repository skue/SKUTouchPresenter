# SGTouchPresenter

This class will show a large dot wherever the screen is touched. The color is
customizable. This is primarily designed for doing presentations with a mirrored
iOS device (iPhone 4S/iPad 2 or later), so the audience can follow the presenter's
touches.

A sample app is included, which allows you to turn the dot on and off and customize
its color:

![](https://raw.github.com/skue/SGTouchPresenter/master/SampleApplication/Screenshot.png)


## Integration

**With Cocoapods:**

  1. Add SGTouchPresenter to your Podfile, and run `pod install`.

**Manually (without Cocoapods):**

  1. Add the `SGTouchPresenter.h` & `SGTouchPresenter.m` files to your project.
  2. Add the `QuartzCore` system framework to your project.

**Important:** if you already use a custom subclass of `UIApplication`, then you
should edit `SGTouchPresenter.h` and change the superclass from `UIApplication` to
the name of your custom subclass — so the inheritance chain is `UIApplication`
-> `YourApplicationSubclass` -> `SGTouchPresenter`


## Usage

Call `showTouchesWithColor:` or `sTouchesWithColor:onlyWhenMirrored:` in your
application delegate, or whenever you want to start showing touches.

`+ (void) showTouchesWithColor: (UIColor *)color`

> When a color is provided, touches will be shown. Passing `nil` will turn it off.

`+ (void) showTouchesWithColor: (UIColor *)color whenMirrored: (BOOL)dynamic`

> This will automatically show touches whenever another screen is connected,
> and stop showing touches when the screen is disconnected. Passing a `nil`
> color will disable the behavior and stop tracking the number of screens.

The SGTouchPresenter class works with or without ARC.


## Implementation Details

When enabled, the class intercepts touch events via `UIApplication sendEvents:`,
displaying a dot wherever a touch occurs. Events are passed onward, so this
shouldn't affect your app's behavior.

In order to intercept events via `UIApplication sendEvents:`, you typically
subclass `UIAppliation`. By default, the code uses dynamic subclassing[1] to
provide this functionality for you automatically the first time you call
`showTouchesWithColor:` or `showTouchesWithColor:onlyWhenMirrored`.
This enables you to wrap these calls with `#define` and only include the
functionality for particular builds.

SGTouchPresenter does not use any private APIs and should be fine for App Store approval.
However, you can set it up manually without the dynamic subclassing: you just need to
add SGTouchPresenter as a custom subclass of `UIApplication`. Here's how to do that:

  1. Follow the integration steps, above.
  1. Edit `main.m` to add `@"SGTouchPresenter"` as the third argument to `UIApplicationMain`.
  2. If your app already uses a custom subclass of `UIApplication` then please see the
     notes about custom subclasses in the Usage section.
  2. If you want to delete the swizzling code to be extra paranoid, open `SGTouchPresenter.m`
     and delete the two blocks of code that say "Can delete if subclassing...".

[1] https://developer.apple.com/library/ios/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/object_setClass

## License

Copyright 2011-2014 Scott Guelich.
May be distributed in accordance with the MIT license.

