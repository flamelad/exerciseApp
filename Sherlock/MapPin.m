//
//  MapPin.m
//  Sherlock
//
//  Created by Yi-Shou on 2014/8/11.
//  Copyright (c) 2014年 Yi-Shou. All rights reserved.
//

#import "MapPin.h"

@interface MapPin()

@end

@implementation MapPin

-(instancetype)initWithPinCoordinate:(CLLocationCoordinate2D )coordinate{
    self = [super init];
    if (self) {
        self.coordinate=coordinate;
    }
    return self;
}

@end
