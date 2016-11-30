//
//  SimpleListViewController.m
//  ApplicationCoordinator
//
//  Created by Igor on 28/11/16.
//  Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "SimpleListViewController.h"

@interface SimpleListViewController ()

@end

@implementation SimpleListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (self.authNeeded) {
        self.authNeeded();
    }
}

- (UIViewController *)toPresent {
    return self;
}

@end
