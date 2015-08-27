//
//  ViewController.h
//  Telephone
//
//  Created by Philron William Hozier on 7/4/15.
//  Copyright (c) 2015 Philron William Hozier. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Telephone-Swift.h"

@interface ViewController : UIViewController{
    UIImageView *smart_object;
//    IBOutlet UIView *the_view;
//    IBOutlet UITextField *text_f1; // username
//    IBOutlet UITextField *text_f2; //password
//    IBOutlet UIButton *login_button;
    
    NSDictionary *map;
}





@property (strong, nonatomic) IBOutlet UIScrollView *scrollView; // currently unused

@property(nonatomic, weak) IBOutlet UIView *the_view;
@property(nonatomic, weak) IBOutlet UITextField *text_f1;
@property(nonatomic, weak) IBOutlet UITextField *text_f2;
@property(nonatomic, weak) IBOutlet UIButton *login_button;
@property(nonatomic, weak) NSDictionary *json;
-(IBAction)button_tapped_dblogin:(id)sender;


@end

