//
//  CardCell.m
//  Telephone
//
//  Created by Philron William Hozier on 8/22/15.
//  Copyright (c) 2015 Philron William Hozier. All rights reserved.
//

#import "CardCell.h"
#import "OBJCard.h"

@implementation CardCell
@synthesize note, nickname, timestamp;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

// override
- (void) layoutSubviews{
    [super layoutSubviews];
    
    //    CGSize parentview_size = self.bounds.size;
    CGRect frame = CGRectMake(50, 50, 200, 200);
    //    [self.textLabel setFrame:frame];
    
//    [note setFrame:frame];
    [note setTextColor:[UIColor blackColor]];

    note.contentMode = UIViewContentModeScaleAspectFit;
//    [[self contentView] addSubview:note];
    
}

@end
