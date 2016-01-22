//
//  Park.h
//  Week2AssessmentJerryLao
//
//  Created by Jerry on 1/22/16.
//  Copyright © 2016 Jerry Lao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Park : NSObject

@property NSString *name;
@property NSString *location;
@property NSString *site;
@property NSString *imageName;

-(instancetype)initWithName:(NSString *)name withLocation:(NSString *)location withSite:(NSString *)site withImageNamed:(NSString *)imageName;

@end
