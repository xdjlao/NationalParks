//
//  DetailViewController.m
//  Week2AssessmentJerryLao
//
//  Created by Jerry on 1/22/16.
//  Copyright © 2016 Jerry Lao. All rights reserved.
//

#import "DetailViewController.h"
#import "ModalViewController.h"
#import "Park.h"

@interface DetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *editNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *editLocationTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.editNameTextField.placeholder = @"Change park name";
    self.editLocationTextField.placeholder = @"Change park location";
    self.locationLabel.text = self.currentPark.location;
    
    UIImage *image = [UIImage imageNamed:self.currentPark.imageName];
    [self.imageView setImage:image];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (![textField.text isEqual:@""]) {
        if (textField.tag == 0) {
            self.currentPark.name = textField.text;
            self.title = textField.text;
            [self.delegate newParkName:textField.text];
            
        } else if (textField.tag == 1) {
            self.currentPark.location = textField.text;
            self.locationLabel.text = textField.text;
        }
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (![textField.text isEqual:@""]) {
        if (textField.tag == 0) {
            self.currentPark.name = textField.text;
            self.title = textField.text;
            [self.delegate newParkName:textField.text];
            
        } else if (textField.tag == 1) {
            self.currentPark.location = textField.text;
            self.locationLabel.text = textField.text;
        }
        [textField resignFirstResponder];
    }
    return YES;
}

- (IBAction)didTapPage:(UITapGestureRecognizer *)sender {
    [self.editNameTextField resignFirstResponder];
    [self.editLocationTextField resignFirstResponder];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ModalViewController *destination = segue.destinationViewController;
    destination.siteUrl = self.currentPark.site;
}

@end
