//
// Created by Igor on 02/12/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

@class SettingsItem;
typedef void(^SettingsBlock)(SettingsItem *item);

@protocol SettingsControllerOutput <FlowControllerOutput>

@property(nonatomic, copy) SettingsBlock showDetailedSettings;

@end