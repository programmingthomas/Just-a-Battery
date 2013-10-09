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
    
    self.battery = [JABBattery batteryMonitor];
    
    //Set up notifications
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateBattery) name:UIDeviceBatteryLevelDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateBattery) name:UIDeviceBatteryStateDidChangeNotification object:nil];
    
    [self updateBattery];
}

-(void)updateBattery
{
    self.batteryView.batteryPercentage = self.battery.currentValue;
    self.levelLabel.text = [NSString stringWithFormat:@"%ld%% remaining", (long)self.battery.currentPercentage];
    self.stateLabel.text = self.battery.batteryStateString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
