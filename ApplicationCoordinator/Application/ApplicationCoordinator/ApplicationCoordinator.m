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
    
    NavigationBlock settingsRun = ^(UINavigationController *navigationController) {
        
        
    };
    
    self.tabbar.onViewDidLoad = [self blockForRun];
    self.tabbar.itemFlowDidSelect = [self blockForRun];
    self.tabbar.settingsFlowDidSelect = settingsRun;

    //This is bad code, that refresh view of tabbar
//    [[[[[[self.tabbar viewControllers] firstObject] viewControllers] firstObject] view] setNeedsDisplay];
    
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
