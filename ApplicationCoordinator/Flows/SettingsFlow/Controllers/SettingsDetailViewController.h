//
//  SettingsDetailViewController.h
//  ApplicationCoordinator
//
//  Created by Igor on 02/12/16.
//  Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "SettingsDetailControllerOutput.h"
#import "SettingsItem.h"

@interface SettingsDetailViewController : UIViewController <SettingsDetailControllerOutput>

@property (nonatomic, strong) SettingsItem *item;

@end
