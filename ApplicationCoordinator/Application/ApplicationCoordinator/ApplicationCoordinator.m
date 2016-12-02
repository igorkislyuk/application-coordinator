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

- (NavigationBlock)blockForSettings {
    return ^(UINavigationController *navigationController) {
        //means we run this block only once
        if (navigationController.viewControllers.count == 0) {
            
        }
    };
}

@end
