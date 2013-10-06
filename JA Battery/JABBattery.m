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

#pragma mark - Blocks and notification handling

-(void)setBatteryPercentageDidChangeBlock:(BatteryPercentageDidChange)block {
    _percentageDidChange = block;
}

-(void)setBatteryStateDidChangeBlock:(BatteryStateDidChange)block {
    _stateDidChange = block;
}

-(void)stateChangedNotification {
    _stateDidChange(self.batteryState, self.batteryStateString);
}

-(void)percentageChangedNotification {
    _percentageDidChange(self.currentValue, self.currentPercentage);
}

#pragma mark - Properties

-(float)currentValue {
    return [[UIDevice currentDevice] batteryLevel];
}

-(NSInteger)currentPercentage {
    return (NSInteger)(self.currentValue * 100.0f);
}

-(UIDeviceBatteryState)batteryState {
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
