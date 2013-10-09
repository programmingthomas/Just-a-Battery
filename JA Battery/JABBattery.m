//
//  JABBattery.m
//  JA Battery
//
//  Created by Thomas Denney on 06/10/2013.
//  Copyright (c) 2013 Programming Thomas. All rights reserved.
//

#import "JABBattery.h"

@implementation JABBattery

#pragma mark - Initialization and singleton

+(instancetype)batteryMonitor
{
    __strong static JABBattery * battery = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        battery = [JABBattery new];
    });
    return battery;
}

-(id)init
{
    self = [super init];
    if (self)
    {
        //This must be enabled otherwise battery state/level will be incorrect
        [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
    }
    return self;
}

#pragma mark - Properties

-(float)currentValue {
//    return 0.5f;
    return [[UIDevice currentDevice] batteryLevel];
}

-(NSInteger)currentPercentage {
    return (NSInteger)(self.currentValue * 100.0f);
}

-(UIDeviceBatteryState)batteryState {
//    return UIDeviceBatteryStateCharging;
    return [[UIDevice currentDevice] batteryState];
}

-(NSString*)batteryStateString
{
    switch (self.batteryState) {
        case UIDeviceBatteryStateCharging:
            return @"Charging";
        case UIDeviceBatteryStateFull:
            return @"Charged";
        case UIDeviceBatteryStateUnplugged:
            return @"Discharging";
        default:
            return @"Unknown";
    }
}

@end
