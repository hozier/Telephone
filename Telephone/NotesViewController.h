//
//  NotesViewController.h
//  Telephone
//
//  Created by Philron Horzier on 8/21/15.
//  Copyright (c) 2015 Philron William Hozier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *the_table_view;
@property (nonatomic, retain) NSArray *books_array;
@property(nonatomic, strong) NSArray *json;


@end
