//
//  SettingsViewController.h
//  ApplicationCoordinator
//
//  Created by Igor on 02/12/16.
//  Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "SettingsControllerOutput.h"

@interface SettingsViewController : UIViewController <SettingsControllerOutput>

@property(nonatomic, copy) SettingsBlock showDetailedSettings;

@end
