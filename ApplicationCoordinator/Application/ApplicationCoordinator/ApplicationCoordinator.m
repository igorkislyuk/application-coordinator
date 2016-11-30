//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ApplicationCoordinator.h"

#import "TabbarFlowOutput.h"
#import "CoordinatorFactory.h"
#import "ItemCoordinator.h"
#import "TabbarViewController.h"

@interface ApplicationCoordinator ()

@property (nonatomic, strong) id <CoordinatorFactory> coordinatorFactory;

@end

@implementation ApplicationCoordinator

- (instancetype)initWithTabbar:(id <TabbarFlowOutput>)tabbar coordinatorFactory:(id <CoordinatorFactory>)coordinatorFactory {
    self = [super init];
    if (self) {
        _tabbar = tabbar;
        _coordinatorFactory = coordinatorFactory;
    }

    return self;
}

- (instancetype)initWithCoordinatorFactory:(id <CoordinatorFactory>)coordinatorFactory {
    self = [super init];
    
    if (self) {

        _tabbar = [self createRootController];
        _coordinatorFactory = coordinatorFactory;

    }

    return self;
}

- (id <TabbarFlowOutput>)createRootController {

    //create controller
    TabbarViewController *tabbarViewController = [[TabbarViewController alloc] initWithNibName:nil bundle:nil];

    //load controllers
    UINavigationController *items = [[UINavigationController alloc] initWithNavigationBarClass:nil toolbarClass:nil];

    UINavigationController *settings = [[UINavigationController alloc] initWithNavigationBarClass:nil toolbarClass:nil];

    items.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Items" image:nil tag:0];
    settings.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Settings" image:nil tag:1];

    tabbarViewController.viewControllers = @[items, settings];

    return tabbarViewController;
}

- (void)start {
    
    NavigationBlock settingsRun = ^(UINavigationController *navigationController) {
        
        
    };
    
    self.tabbar.onViewDidLoad = [self blockForRun];
    self.tabbar.itemFlowDidSelect = [self blockForRun];
    self.tabbar.settingsFlowDidSelect = settingsRun;
}

- (NavigationBlock)blockForRun {
    return ^(UINavigationController *navigationController) {
        if (navigationController.viewControllers.count == 0) {
            ItemCoordinator *itemCoordinator = (ItemCoordinator *) [self.coordinatorFactory createItemCoordinatorWith:navigationController];
            
            [itemCoordinator start];

            [self addDependency:itemCoordinator];
        }
    };
}

@end
