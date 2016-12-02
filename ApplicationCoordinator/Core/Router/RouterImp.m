//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "RouterImp.h"

#import "ItemsViewController.h"

@implementation RouterImp

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController {
    self = [super init];
    if (self) {
        _rootViewController = navigationController;
    }

    return self;
}

- (void)present:(UIViewController *)viewController {
    [self present:viewController animated:YES];
}

- (void)present:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.rootViewController) {
        [self.rootViewController presentViewController:viewController animated:animated completion:nil];
    }
}

- (void)push:(UIViewController *)viewController {
    [self push:viewController animated:YES];
}

- (void)push:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.rootViewController) {
        [self.rootViewController pushViewController:viewController animated:YES];
    }
}

- (void)popController {
    [self popControllerAnimated:YES];
}

- (void)popControllerAnimated:(BOOL)animated {
    if (self.rootViewController) {
        [self.rootViewController popViewControllerAnimated:animated];
    }
}

- (void)dismissController {
    if (self.rootViewController) {
        [self.rootViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)dismissControllerAnimated:(BOOL)animated completion:(void (^)())handler {
    if (self.rootViewController) {
        [self.rootViewController dismissViewControllerAnimated:animated completion:handler];
    }
}

- (void)setRootController:(UIViewController *)viewController {
    
    [self.rootViewController setViewControllers:@[viewController] animated:NO];
}

- (void)popToRootAnimated:(BOOL)animated {
    if (self.rootViewController) {
        [self.rootViewController popToRootViewControllerAnimated:animated];
    }
}

@end
