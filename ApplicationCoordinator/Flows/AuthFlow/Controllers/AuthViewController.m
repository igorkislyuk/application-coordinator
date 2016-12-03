//
//  AuthViewController.m
//  ApplicationCoordinator
//
//  Created by Igor on 30/11/16.
//  Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "AuthViewController.h"

@interface AuthViewController ()

@property (nonatomic, weak) IBOutlet UILabel *authStatusLabel;

@end

@implementation AuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)actionAuth:(id)sender {

    [self setAuthorized:YES];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.onAuthorization) {
            self.onAuthorization(YES);
        }
    });
   
}

- (void)setAuthorized:(BOOL)isAuth {

    if (isAuth) {
        self.authStatusLabel.text = @"You're authorized";
        self.authStatusLabel.textColor = [UIColor greenColor];
    } else {
        self.authStatusLabel.text = @"You're not authorized";
        self.authStatusLabel.textColor = [UIColor redColor];
    }
}

@end
