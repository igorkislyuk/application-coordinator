//
//  AuthViewController.m
//  ApplicationCoordinator
//
//  Created by Igor on 30/11/16.
//  Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "AuthViewController.h"

@interface AuthViewController ()

@end

@implementation AuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)actionAuth:(id)sender {
    if (self.authFinished) {
        self.authFinished();
    }
}

@end
