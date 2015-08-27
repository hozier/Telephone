//
//  BGPROView.m
//  Telephone
//
//  Created by Philron William Hozier on 8/14/15.
//  Copyright (c) 2015 Philron William Hozier. All rights reserved.
//

#import "BGPROView.h"
#import "StyleKitName.h"

@implementation BGPROView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    [StyleKitName drawCanvas1];
    [StyleKitName drawRectPro];
    [StyleKitName drawOval];
    [StyleKitName drawBurgerMenu];
    [StyleKitName drawNotification];
    
}




@end
