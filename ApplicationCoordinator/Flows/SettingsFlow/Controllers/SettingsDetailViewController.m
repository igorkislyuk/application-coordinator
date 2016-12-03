//
//  SettingsDetailViewController.m
//  ApplicationCoordinator
//
//  Created by Igor on 02/12/16.
//  Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "SettingsDetailViewController.h"

@interface SettingsDetailViewController ()

@property (nonatomic, weak) IBOutlet UILabel *settingsLabel;

@end

@implementation SettingsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.settingsLabel.text = [NSString stringWithFormat:@"Subsettings item #%@", self.item.number];
}

@end
