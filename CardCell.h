//
//  CardCell.h
//  Telephone
//
//  Created by Philron William Hozier on 8/22/15.
//  Copyright (c) 2015 Philron William Hozier. All rights reserved.
//

#import <UIKit/UIKit.h>

//IB_DESIGNABLE
@interface CardCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UITextView *note;
@property (strong, nonatomic) IBOutlet UILabel *nickname;
@property (strong, nonatomic) IBOutlet UILabel *timestamp;




@end
