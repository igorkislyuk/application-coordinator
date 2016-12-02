//
// Created by Igor on 03/12/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ItemCreateCoordinatorOutput.h"

@protocol ItemsControllersFactory;

@interface ItemCreateCoordinator : BaseCoordinator <ItemCreateCoordinatorOutput>

@property(nonatomic, copy) EmptyBlock onFinishFlow;

- (instancetype)initWithRouter:(id <Router>)router factory:(id <ItemsControllersFactory>)factory;


@end
