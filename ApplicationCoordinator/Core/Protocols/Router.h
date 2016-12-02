//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

@protocol Router <NSObject>

@required
@property(nonatomic, weak, readonly) UINavigationController *rootViewController;

@required
- (void)present:(UIViewController *)viewController;
- (void)present:(UIViewController *)viewController animated:(BOOL)animated;

- (void)push:(UIViewController *)viewController;
- (void)push:(UIViewController *)viewController animated:(BOOL)animated;

- (void)popController;
- (void)popControllerAnimated:(BOOL)animated;

- (void)dismissController;
- (void)dismissControllerAnimated:(BOOL)animated completion:(void(^)())handler;

- (void)setRootController:(UIViewController *)viewController;
- (void)popToRootAnimated:(BOOL)animated;

@end
