//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "BaseCoordinator.h"

@protocol CoordinatorFactory, Router, ItemControllersFactory;

@interface ItemCoordinator : BaseCoordinator

- (instancetype)initWithCoordinatorFactory:(id <CoordinatorFactory>)coordinatorFactory router:(id <Router>)router controllerFactory:(id <ItemControllersFactory>)factory;

@end
