//
//  AppDelegate.m
//  ApplicationCoordinator
//
//  Created by Igor on 26/11/16.
//  Copyright © 2016 Igor Kislyuk. All rights reserved.
//

#import "AppDelegate.h"

#import "Coordinator.h"

@interface AppDelegate ()

@property (nonatomic, readonly) id <Coordinator> applicationCoordinator;

@end

@implementation AppDelegate {
    id <Coordinator> _applicationCoordinator;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (id <Coordinator>)applicationCoordinator {
    if (_applicationCoordinator == nil) {
        //create application coordinator
        _applicationCoordinator =
    }
}


@end
