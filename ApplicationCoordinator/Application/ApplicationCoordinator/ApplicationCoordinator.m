//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ApplicationCoordinator.h"

#import "TabbarFlowOutput.h"
#import "CoordinatorFactory.h"
#import "ItemCoordinator.h"

@interface ApplicationCoordinator ()

@property (nonatomic, strong) id <TabbarFlowOutput> tabbar;

@property (nonatomic, strong) id <CoordinatorFactory> coordinatorFactory;

@end

@implementation ApplicationCoordinator

- (instancetype)initWithTabbar:(id <TabbarFlowOutput> )tabbar coordinatorFactory:(id <CoordinatorFactory>)coordinatorFactory {
    self = [super init];
    if (self) {
        self.tabbar = tabbar;
        self.coordinatorFactory = coordinatorFactory;
    }

    return self;
}

- (void)start {

    NavigationBlock runItem = ^(UINavigationController *navigationController) {
        if (navigationController.viewControllers.count == 0) {
            ItemCoordinator *itemCoordinator = (ItemCoordinator *) [self.coordinatorFactory createItemCoordinatorWith:navigationController];
            [itemCoordinator start];

            [self addDependency:itemCoordinator];
        } else {
            NSLog(@"non-empty nav");
            abort();
        }
    };

    NavigationBlock settingsRun = ^(UINavigationController *navigationController) {



    };

    self.tabbar.onViewDidLoad = runItem;
    self.tabbar.itemFlowDidSelect = runItem;
    self.tabbar.settingsFlowDidSelect = settingsRun;

}

@end
