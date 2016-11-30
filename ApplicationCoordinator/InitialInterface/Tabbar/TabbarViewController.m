//
//  TabbarViewController.m
//  ApplicationCoordinator
//
//  Created by Igor on 26/11/16.
//  Copyright © 2016 Igor Kislyuk. All rights reserved.
//

#import "TabbarViewController.h"

@interface TabbarViewController () <UITabBarControllerDelegate>

@end

@implementation TabbarViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.delegate = self;
    
    //post message
    if (self.onViewDidLoad) {
        self.onViewDidLoad(self.viewControllers.firstObject);
    }
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {

    NSUInteger selectedIndex = tabBarController.selectedIndex;
    UINavigationController *navigationController = tabBarController.viewControllers[selectedIndex];

    if (selectedIndex == 0) {
        if (self.itemFlowDidSelect) {
            self.itemFlowDidSelect(navigationController);
        }
    } else if (selectedIndex == 1) {
        if (self.settingsFlowDidSelect) {
            self.settingsFlowDidSelect(navigationController);
        }
    }
}

- (void)loadView {
    [super loadView];
}

@end
