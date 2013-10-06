//
//  JABViewController.h
//  JA Battery
//
//  Created by Thomas Denney on 06/10/2013.
//  Copyright (c) 2013 Programming Thomas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JABBattery.h"
#import "JABBatteryView.h"

@interface JABViewController : UIViewController
@property (weak, nonatomic) IBOutlet JABBatteryView *batteryView;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;

@end
