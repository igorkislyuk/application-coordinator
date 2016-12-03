//
//  ItemsViewController.m
//  ApplicationCoordinator
//
//  Created by Igor on 28/11/16.
//  Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ItemsViewController.h"

@interface ItemsViewController ()

@end

@implementation ItemsViewController {
    BOOL authorized;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    authorized = NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionAdd:)];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    if (!authorized) {
        
        if (self.authNeeded) {
            self.authNeeded();
        }
        
        authorized = YES;
    }
    
}

- (IBAction)actionSelect:(id)sender {
    
    if (self.onSelection) {
        self.onSelection(nil);
    }
}

- (IBAction)actionAdd:(id)sender {
    
    if (self.onCreate) {
        self.onCreate();
    }
}

@end
