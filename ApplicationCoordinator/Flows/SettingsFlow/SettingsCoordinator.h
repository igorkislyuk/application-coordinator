//
// Created by Igor on 02/12/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

@protocol SettingsControllerFactory;

@interface SettingsCoordinator : BaseCoordinator

- (instancetype)initWithFactory:(id <SettingsControllerFactory>)factory router:(id <Router>)router;

@end