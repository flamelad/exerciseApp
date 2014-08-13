//
//  MapPin.h
//  Sherlock
//
//  Created by Yi-Shou on 2014/8/11.
//  Copyright (c) 2014年 Yi-Shou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapPin : NSObject<MKAnnotation>
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
-(instancetype)initWithPinCoordinate:(CLLocationCoordinate2D )coordinate;
@end
