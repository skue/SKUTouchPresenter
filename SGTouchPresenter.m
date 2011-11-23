//
//  SGTouchPresenter.m
//  SGTouchPresenter
//  
//  Copyright 2011 Scott Guelich
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


#import "SGTouchPresenter.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>


#define kWindowLevel    (2 * UIWindowLevelAlert)
#define kTouchRadius    20
#define kTapDelay       0.1


static UIWindow *overlayWindow = nil;
static BOOL showsTouches = NO;
static UIColor *touchColor = nil;
static NSMutableDictionary *touchLayers = nil;


@implementation SGTouchPresenter


+ (void) showTouchesWithColor: (UIColor *)color
{
#if __has_feature(objc_arc)
    touchColor = color;
#else
    [touchColor autorelease];
    touchColor = [color retain];
#endif
    showsTouches = (color != nil);
    
    if ( showsTouches ) {
        if ( overlayWindow ) {
            for ( CALayer *layer in [touchLayers allValues] ) {
                layer.backgroundColor = color.CGColor;
            }
        }
        else {
            // isa swizzling - Treat our application as an instance of SGTouchPresenter
            [[UIApplication sharedApplication] setValue:[SGTouchPresenter class] forKey:@"isa"];
            
            touchLayers = [[NSMutableDictionary alloc] init];
            overlayWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
            overlayWindow.opaque = NO;
            overlayWindow.backgroundColor = [UIColor clearColor];
            overlayWindow.windowLevel = kWindowLevel;
            overlayWindow.userInteractionEnabled = NO;
            overlayWindow.hidden = NO;
        }
    }
    else {
        if ( overlayWindow ) {
            // Restore default UIApplication behavior
            [[UIApplication sharedApplication] setValue:[UIApplication class] forKey:@"isa"];
            
#if !__has_feature(objc_arc)
            [overlayWindow release];
            [touchLayers release];
#endif
            overlayWindow = nil;
            touchLayers = nil;
        }
    }
}


- (void) showTouches: (NSSet *)touches
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    for ( UITouch *touch in touches ) {
        CGPoint touchPosition = [touch locationInView:nil];
        NSNumber *touchKey = [NSNumber numberWithUnsignedInteger:[touch hash]];
        CALayer *layer = [touchLayers objectForKey:touchKey];
        
        if ( !layer ) {
            layer = [CALayer layer];
            layer.bounds = CGRectMake( 0, 0, kTouchRadius * 2, kTouchRadius * 2 );
            layer.cornerRadius = kTouchRadius;
            layer.backgroundColor = touchColor.CGColor;
            layer.opacity = 1;
            [overlayWindow.layer addSublayer:layer];
            [touchLayers setObject:layer forKey:touchKey];
        }
        
        switch ( touch.phase ) {
            case UITouchPhaseStationary:
            case UITouchPhaseBegan:
            case UITouchPhaseMoved:
                layer.position = touchPosition;
                break;
                
            case UITouchPhaseCancelled:
            case UITouchPhaseEnded: {
                // Add small delay unless part of gesture recognizer (makes quick taps more noticeable)
                double delay = [touch.gestureRecognizers count] == 1 ? 0 : kTapDelay;
                dispatch_after( dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                    [layer removeFromSuperlayer];
                });
                [touchLayers removeObjectForKey:touchKey];
                break;
            }
        }
    }
    [CATransaction commit];
}


- (void) sendEvent: (UIEvent *)event
{
    if ( showsTouches && event.type == UIEventTypeTouches ) {
        [self showTouches:event.allTouches];
    }
    [super sendEvent:event];
}

@end
