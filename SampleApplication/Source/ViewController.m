//
//  ViewController.m
//  SGPresentationApplication
//
//  Created by Scott Guelich on 11/22/11.
//  Copyright (c) 2011 Consano. All rights reserved.
//

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
