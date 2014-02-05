//
//  ViewController.h
//  SKUTouchPresenter
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

@interface ViewController : UITableViewController

@property (nonatomic, weak) IBOutlet UISwitch *showTouchesToggle;
@property (nonatomic, weak) IBOutlet UISwitch *dynamicTouchesToggle;

@property (nonatomic, weak) IBOutlet UISlider *redSlider;
@property (nonatomic, weak) IBOutlet UISlider *greenSlider;
@property (nonatomic, weak) IBOutlet UISlider *blueSlider;
@property (nonatomic, weak) IBOutlet UISlider *alphaSlider;


- (IBAction) toggleShowTouches:(UISwitch *)toggle;
- (IBAction) toggleDynamicTouches:(UISwitch *)toggle;

- (IBAction) changedRed:(UISlider *)slider;
- (IBAction) changedGreen:(UISlider *)slider;
- (IBAction) changedBlue:(UISlider *)slider;
- (IBAction) changedAlpha:(UISlider *)slider;

- (IBAction) showAlert:(id)sender;
- (IBAction) showSheet:(id)sender;

@end
