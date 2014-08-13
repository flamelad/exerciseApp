//
//  Photo.h
//  Sherlock
//
//  Created by Yi-Shou on 2014/7/29.
//  Copyright (c) 2014年 Yi-Shou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Photographer;

@interface Photo : NSManagedObject

@property (nonatomic, retain) NSString * ddd;
@property (nonatomic, retain) NSString * eee;
@property (nonatomic, retain) NSString * photoURL;
@property (nonatomic, retain) NSString * subtitle;
@property (nonatomic, retain) NSData * thumbnailData;
@property (nonatomic, retain) NSString * thumbnailURL;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * uploadDate;
@property (nonatomic, retain) Photographer *whoTook;

@end
