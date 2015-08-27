//
//  ProfileViewController.h
//  Telephone
//
//  Created by Philron Horzier on 8/14/15.
//  Copyright (c) 2015 Philron William Hozier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ProfileViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *button_msg_icon;
@property (strong, nonatomic) IBOutlet UILabel *label_minimal_initial;
@property (strong, nonatomic) IBOutlet UIImageView *circular_profile_picture;
@property (strong, nonatomic) IBOutlet UILabel *label_uid;
@property(strong, nonatomic)  NSDictionary *basic_user_json;
- (IBAction)button_msg_icon_tapped:(id)sender;
@end
