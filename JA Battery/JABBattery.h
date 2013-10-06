//
//  JABBattery.h
//  JA Battery
//
//  Created by Thomas Denney on 06/10/2013.
//  Copyright (c) 2013 Programming Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^BatteryPercentageDidChange)(float, NSInteger);
typedef void(^BatteryStateDidChange)(UIDeviceBatteryState, NSString*);

@interface JABBattery : NSObject
{
    BatteryPercentageDidChange _percentageDidChange;
    BatteryStateDidChange _stateDidChange;
}

+(instancetype)batteryMonitor;

-(float)currentValue;
-(NSInteger)currentPercentage;
-(UIDeviceBatteryState)batteryState;
-(NSString*)batteryStateString;

-(void)setBatteryPercentageDidChangeBlock:(BatteryPercentageDidChange)block;
-(void)setBatteryStateDidChangeBlock:(BatteryStateDidChange)block;

@end
