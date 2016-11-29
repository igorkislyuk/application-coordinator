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
    
//    [self createInterface];
    
    //create coordinator
    [self createApplicationCoordinatorWithViewController:(TabbarViewController *)(self.window.rootViewController)];
    
    [_applicationCoordinator start];
    
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

- (void)createInterface {
    
    //create controller
    TabbarViewController *tabbarViewController = [[TabbarViewController alloc] init];
    
    //load controllers
    UINavigationController *items = [[UINavigationController alloc] initWithNavigationBarClass:nil toolbarClass:nil];
    
    UINavigationController *settings = [[UINavigationController alloc] initWithNavigationBarClass:nil toolbarClass:nil];
    
    tabbarViewController.viewControllers = @[items, settings];
    
    //create window
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [window setRootViewController:tabbarViewController];
    [window addSubview:tabbarViewController.view];
    
    self.window = window;
    [self.window makeKeyAndVisible];

}


@end
