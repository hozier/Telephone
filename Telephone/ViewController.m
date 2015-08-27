//
//  ViewController.m
//  Telephone
//
//  Created by Philron William Hozier on 7/4/15.
//  Copyright (c) 2015 Philron William Hozier. All rights reserved.
//
#import "ViewController.h"
#import "ProfileViewController.h"
#import "RequestsAPI.h"

@interface ViewController ()

@end
@implementation ViewController


@synthesize text_f1, text_f2, login_button, json; // look into the synth syntax more

////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////

- (void)bottom_line:(UITextField*)text_f{
    CGFloat borderWidth = 1;
    CALayer *border = [CALayer layer]; // creates an instance of the class
    
    border.borderColor = [UIColor grayColor].CGColor;
    border.frame = CGRectMake(0,
                   text_f.frame.size.height - borderWidth,
                   text_f.frame.size.width,
                   text_f.frame.size.height);
    
    border.borderWidth = borderWidth;
    
    [text_f.layer addSublayer:border];
    text_f.layer.masksToBounds = YES;
    
}

 /// implement oauth2 provider connection here.
 // patch in python script with fucntionality to provide consumer key secret values 
 // with expected return of token -- which will then all us to make seamless api calls to 
 // our hosted api endpoints

-(void)outline:(UIButton *) button{
    [[button layer] setBorderWidth:1.0];
    [[button layer] setBorderColor:[UIColor grayColor].CGColor];
}

- (UIStatusBarStyle)preferredStatusBarStyle { return UIStatusBarStyleLightContent; }

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    
    [self bottom_line:text_f1];
    [self bottom_line:text_f2];
    [self outline:login_button];
    
    NSLog(@"this is text_f1 %@", text_f1.text);
    NSLog(@"this is text_f2 %@", text_f2.text);
    
//    MKTextField *stewie = [[MKTextField alloc]init];
//    [stewie new_instance];

    
    // Do any additional setup after loading the view, typically from a nib.
    
    // smart_object = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 376, 287 )];
    // smart_object.image = [UIImage imageNamed:@"smartobject.jpg"];
    // [self.view addSubview:smart_object];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    NSLog(@"prepareForSegue: %@", segue.identifier);
    if([segue.identifier isEqualToString:@"user_profile_view"]){
        // ! ! Remember to connect the custom UIViewController class in storyboard ! !
        ProfileViewController *transferViewController = segue.destinationViewController;
        NSLog(@"this is the segue.destinationViewController inside: %@", segue.destinationViewController);

        transferViewController.basic_user_json = json;
    }
    
}


-(IBAction)button_tapped_dblogin:(id)sender{
    NSLog(@" this works");
    NSLog(@"this is text_f1 %@", text_f1.text);
    NSLog(@"this is text_f2 %@", text_f2.text);
        
    [RequestsAPI make_request_with_route: @"login"
              query_string_option: [[NSString alloc]initWithFormat: @"?uid=%@&password=%@", text_f1.text, text_f2.text]
            request_method_option: @"POST" 
        
               completion_handler: ^(BOOL success, NSData *res_data, NSError *error){ // define callback two here
                   // IMPORTANT - Only update the UI on the main thread
                   dispatch_async(dispatch_get_main_queue(), ^{
                       json = [[RequestsAPI to_dictionary:res_data] objectForKey:@"user"];
                       if (success) { NSLog(@"the response data dict: %@", json);
                       [self performSegueWithIdentifier:@"user_profile_view" sender:sender];
                       }
                   }); 
               }
    ]; // end method call.

}
@end
