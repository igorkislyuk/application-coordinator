//
//  SettingsViewController.m
//  ApplicationCoordinator
//
//  Created by Igor on 02/12/16.
//  Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionShowDetailed {
    
    if (self.showDetailedSettings) {
        self.showDetailedSettings(nil);
    }
    
}



@end
