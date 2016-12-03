//
//  ItemCreateViewController.m
//  ApplicationCoordinator
//
//  Created by Igor on 03/12/16.
//  Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ItemCreateViewController.h"

#import "Item.h"

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
        self.onItemCreate([[Item alloc] init]);
    }

}

- (IBAction)actionHide:(id)sender {
    if (self.onHide) {
        self.onHide();
    }
}


@end
