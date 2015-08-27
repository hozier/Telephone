//
//  AppDelegate.m
//  Telephone
//
//  Created by Philron William Hozier on 7/4/15.
//  Copyright (c) 2015 Philron William Hozier. All rights reserved.
//

#import "AppDelegate.h"
//#import "Telephone-Swift.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

static dispatch_once_t once;
static NSOperationQueue *connectionQueue;

/**
prevents our app from becoming unresponsive while we wait for requests to finish
+ : class method, calls it on the class in which it is created -- in this case being AppDelegate
 **/
+(NSOperationQueue *)connectionQueue{
    dispatch_once(&once, ^{
        connectionQueue = [[NSOperationQueue alloc] init];
        [connectionQueue setMaxConcurrentOperationCount:5]; // we limit the user to too many requests to the api
        [connectionQueue setName:@"com.theproductcompany.connectionqueue"];
    });
                  
    return connectionQueue;
}


-(void)applicationDidFinishLaunching:(NSNotification *)aNotification{
//    MKTextField *swiftObject = [[MKTextField alloc] init];
//    [swiftObject run];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
