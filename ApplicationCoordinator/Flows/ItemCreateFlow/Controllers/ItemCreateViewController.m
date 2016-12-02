//
//  ItemCreateViewController.m
//  ApplicationCoordinator
//
//  Created by Igor on 03/12/16.
//  Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ItemCreateViewController.h"

@interface ItemCreateViewController ()

@end

@implementation ItemCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                          target:self
                                                                                          action:@selector(actionHide:)];
}

- (IBAction)actionCreate:(id)sender {

    if (self.onItemCreate) {
        self.onItemCreate(nil);
    }

}

- (IBAction)actionHide:(id)sender {
    if (self.onHide) {
        self.onHide();
    }
}

- (UIViewController *)toPresent {
    return self;
}


@end
