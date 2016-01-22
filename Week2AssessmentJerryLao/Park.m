//
//  Park.m
//  Week2AssessmentJerryLao
//
//  Created by Jerry on 1/22/16.
//  Copyright © 2016 Jerry Lao. All rights reserved.
//

#import "Park.h"

@implementation Park

-(instancetype)initWithName:(NSString *)name withLocation:(NSString *)location withSite:(NSString *)site withImageNamed:(NSString *)imageName {
    self = [super init];
    
    self.name = name;
    self.location = location;
    self.site = site;
    self.imageName = imageName;
    
    return self;
}

@end
