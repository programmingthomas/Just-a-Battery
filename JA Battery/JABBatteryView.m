//
//  JABBatteryView.m
//  JA Battery
//
//  Created by Thomas Denney on 06/10/2013.
//  Copyright (c) 2013 Programming Thomas. All rights reserved.
//

#import "JABBatteryView.h"

@implementation JABBatteryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    BatteryDrawingFunction(UIGraphicsGetCurrentContext(), rect, self.batteryPercentage);
}

-(void)setBatteryPercentage:(float)batteryPercentage
{
    if (batteryPercentage != _batteryPercentage)
    {
        _batteryPercentage = batteryPercentage;
        [self setNeedsDisplay];
    }
}

@end
