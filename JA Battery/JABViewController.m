//
//  JABViewController.m
//  JA Battery
//
//  Created by Thomas Denney on 06/10/2013.
//  Copyright (c) 2013 Programming Thomas. All rights reserved.
//

#import "JABViewController.h"

@interface JABViewController ()

@end

@implementation JABViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    JABBattery * battery = [JABBattery batteryMonitor];
    
    //These blocks will be called immediately after they are set to set the default values
    [battery setBatteryPercentageDidChangeBlock:^(float fValue, NSInteger iValue) {
        self.batteryView.batteryPercentage = fValue;
        self.levelLabel.text = [NSString stringWithFormat:@"%ld%% remaining", (long)iValue];
    }];
    
    [battery setBatteryStateDidChangeBlock:^(UIDeviceBatteryState state, NSString * stateString) {
        self.stateLabel.text = stateString;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
