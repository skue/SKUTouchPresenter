//
//  ViewController.h
//  SGPresentationApplication
//
//  Created by Scott Guelich on 11/22/11.
//  Copyright (c) 2011 Consano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController

@property (nonatomic, weak) IBOutlet UISwitch *toggle;

@property (nonatomic, weak) IBOutlet UISlider *redSlider;
@property (nonatomic, weak) IBOutlet UISlider *greenSlider;
@property (nonatomic, weak) IBOutlet UISlider *blueSlider;
@property (nonatomic, weak) IBOutlet UISlider *alphaSlider;


- (IBAction) toggleShowTouches:(UISwitch *)toggle;

- (IBAction) changedRed:(UISlider *)slider;
- (IBAction) changedGreen:(UISlider *)slider;
- (IBAction) changedBlue:(UISlider *)slider;
- (IBAction) changedAlpha:(UISlider *)slider;

- (IBAction) showAlert:(id)sender;
- (IBAction) showSheet:(id)sender;

@end
