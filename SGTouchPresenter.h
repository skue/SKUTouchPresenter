//
//  SGTouchPresenter.h
//  SGTouchPresenter
//
//  Copyright 2011-2014 Scott Guelich.
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included
//  in all copies or substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
//  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.


#import <UIKit/UIKit.h>

/**
 * SGTouchPresenter allows you to demo your app to an audience and have
 * them follow your touches. It displays a dot (or multiple dots) wherever
 * the screen is touched. You can configure the dot's color and opacity,
 * and you can also have the dot(s) appear only when the device is
 * mirroring to a second display (via AirPlay or adapter cable).
 *
 * Install via Cocoapods or manually (see the README for more details).
 *
 * **Important:** SGTouchPresenter recognizes touches by acting as a
 * custom subclass of UIApplication. If your app already uses a custom
 * subclass of UIApplication, then you should edit SGTouchPresenter.h
 * and change the superclass from UIApplication to the name of your
 * custom subclass (so the inheritance chain is UIApplication ->
 * YourApplicationSubclass -> SGTouchPresenter).
 *
 */

@interface SGTouchPresenter : UIApplication

/**
 * Enables (or disables) showing dots wherever the screen is touched.
 *
 * @param color The color of the dot, including alpha. Pass `nil` to disable.
 */
+ (void) showTouchesWithColor: (UIColor *)color;


/**
 * Enable (or disables) showing dots wherever the screen is touched, and
 * optionally only when the device is mirroring to a second display.
 *
 * @param color The color of the dot, including alpha. Pass `nil` to disable.
 * @param mirroredOnly If true, only shows dots when mirrored. Otherwise
 *          behaves the same as showTouchesWithColor:
 */
+ (void) showTouchesWithColor: (UIColor *)color
                 whenMirrored: (BOOL)mirroredOnly;

@end

