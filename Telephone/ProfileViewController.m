//
//  ProfileViewController.m
//  Telephone
//
//  Created by Philron Horzier on 8/14/15.
//  Copyright (c) 2015 Philron William Hozier. All rights reserved.
//

#import "ProfileViewController.h"
#import "RequestsAPI.h"
#import "NotesViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ProfileViewController ()

@end

@implementation ProfileViewController
@synthesize basic_user_json, label_uid, label_minimal_initial;

- (UIStatusBarStyle)preferredStatusBarStyle { return UIStatusBarStyleLightContent; }

//-(void)viewWillLayoutSubviews{
//    NSLog(@"height: %f width:%f", self.circular_profile_picture.frame.size.width, self.circular_profile_picture.frame.size.width);
//    self.circular_profile_picture.layer.cornerRadius = self.circular_profile_picture.frame.size.height / 2;
//    self.circular_profile_picture.clipsToBounds = YES;
//}
- (IBAction)button_msg_icon_tapped:(id)sender {
    
    [self performSegueWithIdentifier:@"msg_view" sender:sender];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];

    [self.circular_profile_picture.layer setCornerRadius:self.circular_profile_picture.frame.size.width/2];
        self.circular_profile_picture.clipsToBounds = YES;

    // borders
//    self.circular_profile_picture.layer.borderWidth = 6.0f;
//    self.circular_profile_picture.layer.borderColor = [UIColor whiteColor].CGColor;


    NSLog(@"THIS IS NEW DATA PULLED IN: %@", basic_user_json);
    [label_uid setTextAlignment:NSTextAlignmentRight];
    label_uid.text = [[NSString alloc]initWithFormat:@"%@", [[basic_user_json valueForKey:@"nickname"] uppercaseString]];
    
    [label_minimal_initial setTextAlignment:NSTextAlignmentCenter];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
