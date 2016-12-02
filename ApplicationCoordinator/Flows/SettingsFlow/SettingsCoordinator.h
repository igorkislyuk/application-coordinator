//
// Created by Igor on 02/12/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

@protocol SettingsControllerFactory;

@interface SettingsCoordinator : BaseCoordinator

@property (nonatomic, strong) id <SettingsControllerFactory> factory;

@end