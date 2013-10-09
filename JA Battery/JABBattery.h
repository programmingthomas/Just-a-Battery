//
//  JABBattery.h
//  JA Battery
//
//  Created by Thomas Denney on 06/10/2013.
//  Copyright (c) 2013 Programming Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JABBattery : NSObject

+(instancetype)batteryMonitor;

-(float)currentValue;
-(NSInteger)currentPercentage;
-(UIDeviceBatteryState)batteryState;
-(NSString*)batteryStateString;

@end
