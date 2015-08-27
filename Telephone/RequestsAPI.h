//
//  RequestsAPI.h
//  Telephone
//
//  Created by Philron William Hozier on 8/13/15.
//  Copyright (c) 2015 Philron William Hozier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestsAPI : NSObject
typedef void (^completion_block_callback)(BOOL success, NSData *json, NSError *error); // this is effectively a callback

+(NSDictionary *)to_dictionary:(NSData *) data;
+(void)make_request_with_route: (NSString *) route
           query_string_option: (NSString *) query_string
         request_method_option: (NSString *) request_method
            completion_handler: (completion_block_callback) callback;

@end
