//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "RouterImp.h"

@implementation RouterImp {
    UINavigationController *_navigationController;
}

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController {
    self = [super init];
    if (self) {
        _navigationController = navigationController;
    }

    return self;
}


- (UINavigationController *)navigationController {
    return _navigationController;
}

- (void)present:(UIViewController *)viewController {
    [self present:viewController animated:YES];
}

- (void)present:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.navigationController) {
        [self.navigationController presentViewController:viewController animated:animated completion:nil];
    }
}

- (void)push:(UIViewController *)viewController {
    [self push:viewController animated:YES];
}

- (void)push:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.navigationController) {
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

- (void)popController {
    [self popControllerAnimated:YES];
}

- (void)popControllerAnimated:(BOOL)animated {
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:animated];
    }
}

- (void)dismissController {
    if (self.navigationController) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)dismissControllerAnimated:(BOOL)animated completion:(void (^)())handler {
    if (self.navigationController) {
        [self.navigationController dismissViewControllerAnimated:animated completion:handler];
    }
}

- (void)setRootController:(UIViewController *)viewController {
//    NSParameterAssert([viewController isKindOfClass:[UINavigationController class]]);

    [_navigationController setViewControllers:@[viewController] animated:YES];
}

- (void)popToRootAnimated:(BOOL)animated {
    if (self.navigationController) {
        [self.navigationController popToRootViewControllerAnimated:animated];
    }
}

@end
