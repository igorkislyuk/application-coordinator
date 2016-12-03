//
// Created by Igor on 02/12/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

@protocol SettingsControllerOutput;
@protocol SettingsDetailControllerOutput;
@class SettingsItem;

@protocol SettingsControllerFactory <NSObject>

- (id <SettingsControllerOutput>)createSettingsOutput;

- (id <SettingsDetailControllerOutput>)createSettingsDetailOutputWith:(SettingsItem *)settingsItem;

@end