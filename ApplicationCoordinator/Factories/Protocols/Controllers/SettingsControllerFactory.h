//
// Created by Igor on 02/12/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SettingsControllerOutput;
@protocol SettingsDetailControllerOutput;

@protocol SettingsControllerFactory <NSObject>

- (id <SettingsControllerOutput>)createSettingsOutput;

- (id <SettingsDetailControllerOutput>)createSettingsDetailOutput;

@end