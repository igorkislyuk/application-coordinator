//
//  AppDelegate.m
//  ApplicationCoordinator
//
//  Created by Igor on 26/11/16.
//  Copyright © 2016 Igor Kislyuk. All rights reserved.
//

#import "AppDelegate.h"

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

    //create controller
    TabbarViewController *tabbarViewController = [[TabbarViewController alloc] init];
    
    //create coordinator
    [self createApplicationCoordinatorWithViewController:tabbarViewController];
    
    [_applicationCoordinator start]
    
    //create window
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [window setRootViewController:tabbarViewController];
    [window addSubview:tabbarViewController.view];
    
    self.window = window;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)createApplicationCoordinatorWithViewController:(id <TabbarFlowOutput>)vc {
    if (_applicationCoordinator == nil) {
        
        CoordinatorFactoryImp *coordinatorFactoryImp = [[CoordinatorFactoryImp alloc] init];
        
        //create application coordinator
        _applicationCoordinator = [[ApplicationCoordinator alloc] initWithTabbar:vc
                                                              coordinatorFactory:coordinatorFactoryImp];

    }
}


@end
