//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "BaseCoordinator.h"

@protocol CoordinatorFactory, Router, ItemsControllersFactory;

@interface ItemsCoordinator : BaseCoordinator

- (instancetype)initWithCoordinatorFactory:(id <CoordinatorFactory>)coordinatorFactory router:(id <Router>)router controllerFactory:(id <ItemsControllersFactory>)factory;

@end
