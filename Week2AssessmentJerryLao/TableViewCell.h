//
//  TableViewCell.h
//  Week2AssessmentJerryLao
//
//  Created by Jerry on 1/22/16.
//  Copyright © 2016 Jerry Lao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *leftImage;
@property (weak, nonatomic) IBOutlet UILabel *parkNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *parkLocationLabel;


@end
