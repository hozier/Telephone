//
//  RequestsAPI.m
//  Telephone
//
//  Created by Philron William Hozier on 8/13/15.
//  Copyright (c) 2015 Philron William Hozier. All rights reserved.
//

#import "RequestsAPI.h"
#import "AppDelegate.h"

@implementation RequestsAPI

/**
 as reference:
 typedef struct Books
 {
 char  title[50];
 char  author[50];
 char  subject[100];
 int   book_id;
 } Book;
 
 - Book is now a new named type
 **/

/** typedef [return type] ^[variable name] [block parameters]
 
 block body:
 = ^[block parameters]{ return [return type] }
 
 to call: [variable name]();
 
 
 **/


//typedef void (^completion_block_callback)(BOOL success, NSDictionary *json, NSError *error); // this is effectively a callback

+(NSDictionary *)to_dictionary:(NSData *) data{
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

+(void)make_request_with_route: (NSString *) route
           query_string_option: (NSString *) query_string // consider the variadic option.
         request_method_option: (NSString *) request_method
            completion_handler: (completion_block_callback) callback{
    
    NSURL *base_url = [NSURL URLWithString:@"https://pacific-mesa-7186.herokuapp.com/ios/api/v1/"];
    NSURL *api_endpoint = [NSURL URLWithString:
                           [[NSString alloc]initWithFormat:@"%@%@", route, query_string] relativeToURL:base_url];
    NSMutableURLRequest *the_request = [NSMutableURLRequest requestWithURL: api_endpoint];
    the_request.HTTPMethod = request_method;
    
    // Send the request !
    [NSURLConnection sendAsynchronousRequest: the_request
                                       queue: [AppDelegate connectionQueue]
                           completionHandler: ^(NSURLResponse *response, NSData *data, NSError *err){ // define callback one here
                               /**
                                The NSURLConnection class sets these parameters for us when the request
                                completes and passes on the data to us through this block.
                                overview: our completion block logic lives here
                                **/
                               
                               if (err) { NSLog(@"Error in make_request: %@ %@", err, [err localizedDescription]); }
                               else if (!response) { NSLog(@"Could not reach server!"); }
                               else if (!data) { NSLog(@"Server did not return any data!"); }
                               else if ((long)[(NSHTTPURLResponse *) response statusCode] == 200){ // if valid
                                   
                                   NSLog(@"response CODE: %ld",(long)[(NSHTTPURLResponse *) response statusCode]);
                                   //NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
                                   
                                   callback(YES, data, nil); // might need to replace stringFromData with line above
                               }
                               else { // invalid login
                                   NSLog(@"status code: %ld", (long)[(NSHTTPURLResponse *) response statusCode]);
                               }
                           }
     ];
    
}

@end
