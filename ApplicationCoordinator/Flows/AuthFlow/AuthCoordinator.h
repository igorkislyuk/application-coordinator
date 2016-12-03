//
// Created by Igor on 30/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "AuthCoordinatorOutput.h"
#import "AuthControllersFactory.h"

@interface AuthCoordinator : BaseCoordinator <AuthCoordinatorOutput>

- (instancetype)initWithRouter:(id <Router>)router factory:(id <AuthControllersFactory>)factory;

@property(nonatomic, copy) EmptyBlock finishFlow;

@end
