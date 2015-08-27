//
//  NotesViewController.m
//  Telephone
//
//  Created by Philron Horzier on 8/21/15.
//  Copyright (c) 2015 Philron William Hozier. All rights reserved.
//

#import "NotesViewController.h"
#import "CardCell.h"
#import "RequestsAPI.h"
#define NONE @""

@interface NotesViewController ()

@end

@implementation NotesViewController
@synthesize the_table_view, books_array;



- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.books_array = [NSArray arrayWithObjects:@"Brave new world",@"Call of the Wild",@"Catch-22",@"Atlas Shrugged",@"The Great Gatsby",@"The Art of War",@"The Catcher in the Rye",@"The Picture of Dorian Gray",@"The Grapes of Wrath", @"The Metamorphosis", nil];
    
    [RequestsAPI make_request_with_route: @"list_all"
                     query_string_option: NONE
                   request_method_option: @"GET"
     
                      completion_handler: ^(BOOL success, NSData *res_data, NSError *error){ // define callback two here
                          // IMPORTANT - Only update the UI on the main thread
                          dispatch_async(dispatch_get_main_queue(), ^{
                              
                              if (success) {
                                  self.json = [[RequestsAPI to_dictionary:res_data] objectForKey:@"users"];
                                  [the_table_view reloadData]; // this line is so crucial to triggering the data to populate the card views once array is loaded.

                                  NSLog(@"this is the response data dict ok: %@", self.json);

                              }
                          });
                      }
     ]; // end method call.

    
    // next. configuring the datasource -- now that we have the data structure constructed, we can determine
    // the number of rows in our table view
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.json.count;
}



// Customize the appearance of table view cells.
- (UITableViewCell *) tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString *current = [[NSString alloc]initWithString:[[self.json objectAtIndex:indexPath.row] objectForKey:@"nickname"]];

    
    static NSString *CellIdentifier = @"cell";
    CardCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[CardCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.note.font = [UIFont fontWithName:@"Avenir Next" size:17.0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone ;

    [cell.nickname setText: current];

    

    return cell;
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
