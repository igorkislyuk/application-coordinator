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
    
    
    
    //create coordinator
    [self createApplicationCoordinatorWithViewController:(TabbarViewController *)(self.window.rootViewController)];
    
    [_applicationCoordinator start];
    
    [self createInterface];
    
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
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //create controller
    TabbarViewController *tabbarViewController = [[TabbarViewController alloc] init];
    
    //load controllers
    UINavigationController *items = [[UINavigationController alloc] initWithNavigationBarClass:nil toolbarClass:nil];
    
    UINavigationController *settings = [[UINavigationController alloc] initWithNavigationBarClass:nil toolbarClass:nil];
    
    items.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Items" image:nil tag:0];
    [settings setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Settings" image:nil tag:1]];
    
    tabbarViewController.viewControllers = @[items, settings];
    [window addSubview:tabbarViewController.view];
    
    //create window
    self.window = window;
    [self.window makeKeyAndVisible];
    
    [window setRootViewController:tabbarViewController];

}


@end
