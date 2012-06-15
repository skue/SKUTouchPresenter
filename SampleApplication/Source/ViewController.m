//
//  ViewController.m
//  SGTouchPresenter
//
//  Copyright 2011-2012 Scott Guelich.
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

#import "ViewController.h"
#import "SGTouchPresenter.h"

@interface ViewController () {
    CGFloat red, green, blue, alpha;
}

- (void) updateTouchColor;
@end


@implementation ViewController

@synthesize showTouchesToggle, dynamicTouchesToggle, redSlider, greenSlider, blueSlider, alphaSlider;

- (void) viewDidLoad {
    red     = self.redSlider.value;
    green   = self.greenSlider.value;
    blue    = self.blueSlider.value;
    alpha   = self.alphaSlider.value;
    [self updateTouchColor];
}

- (void) updateTouchColor {
    BOOL showTouches = showTouchesToggle.on, dynamic = dynamicTouchesToggle.on;
    
    if ( showTouches ) {
        UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        [SGTouchPresenter showTouchesWithColor:color onlyWhenMirrored:dynamic];
    }
    else {
        [SGTouchPresenter showTouchesWithColor:nil onlyWhenMirrored:NO];
    }
}

- (IBAction) toggleShowTouches:(UISwitch *)toggle {
    dynamicTouchesToggle.enabled = toggle.on;
    if ( !toggle.on ) {
        dynamicTouchesToggle.on = NO;
    }
    [self updateTouchColor];
}

- (IBAction) toggleDynamicTouches:(UISwitch *)toggle {
    [self updateTouchColor];
}

- (IBAction) changedRed:(UISlider *)slider {
    red = slider.value;
    [self updateTouchColor];
}

- (IBAction) changedGreen:(UISlider *)slider {
    green = slider.value;
    [self updateTouchColor];
}

- (IBAction) changedBlue:(UISlider *)slider {
    blue = slider.value;
    [self updateTouchColor];
}

- (IBAction) changedAlpha:(UISlider *)slider {
    alpha = slider.value;
    [self updateTouchColor];
}


- (IBAction) showAlert:(id)sender {
    [[[UIAlertView alloc] initWithTitle: @"Touch Presenter"
                                message: @"Touches work on alerts too!"
                               delegate: nil
                      cancelButtonTitle: @"Cool"
                      otherButtonTitles: nil] show];
}

- (IBAction) showSheet:(id)sender {
    [[[UIActionSheet alloc] initWithTitle: @"Also works on action sheets!"
                                 delegate: nil
                        cancelButtonTitle: @"Sweet"
                   destructiveButtonTitle: nil
                        otherButtonTitles: nil] showInView:self.view];
}

@end
