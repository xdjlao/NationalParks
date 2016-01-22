//
//  DetailViewController.h
//  Week2AssessmentJerryLao
//
//  Created by Jerry on 1/22/16.
//  Copyright © 2016 Jerry Lao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Park.h"

@protocol DetailViewControllerDelegate <NSObject>

@required

- (void) newParkName:(NSString *)parkName;

@end

@interface DetailViewController : UIViewController

@property (nonatomic, assign) id <DetailViewControllerDelegate> delegate;
@property Park* currentPark;

@end
