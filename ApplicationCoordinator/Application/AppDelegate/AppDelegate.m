//
//  AppDelegate.m
//  ApplicationCoordinator
//
//  Created by Igor on 26/11/16.
//  Copyright © 2016 Igor Kislyuk. All rights reserved.
//

#import "AppDelegate.h"
#import <objc/objc.h>
#import <objc/runtime.h>

#import "Coordinator.h"
#import "ApplicationCoordinator.h"
#import "CoordinatorFactoryImp.h"
#import "TabbarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {
    ApplicationCoordinator *_applicationCoordinator;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //create coordinator
    [self createApplicationCoordinator];
    
    [_applicationCoordinator start];
    
    return YES;
}

- (void)createApplicationCoordinator {
    if (_applicationCoordinator == nil) {
    
        CoordinatorFactoryImp *coordinatorFactoryImp = [[CoordinatorFactoryImp alloc] init];
        
        _applicationCoordinator = [[ApplicationCoordinator alloc] initWithTabbar:(id <TabbarFlowOutput>)self.window.rootViewController coordinatorFactory:coordinatorFactoryImp];

    }
}

@end
