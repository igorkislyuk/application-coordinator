//
// Created by Igor on 30/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseCoordinator.h"
#import "AuthFlowOutput.h"
#import "AuthControllersFactory.h"

@interface AuthCoordinator : BaseCoordinator <AuthFlowOutput>

- (instancetype)initWithRouter:(id <Router>)router factory:(id <AuthControllersFactory>)factory;

@property(nonatomic, copy) EmptyBlock finishFlow;

@end
