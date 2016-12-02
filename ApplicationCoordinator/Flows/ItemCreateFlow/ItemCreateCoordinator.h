//
// Created by Igor on 03/12/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ItemCreateCoordinatorOutput.h"

@protocol ItemsControllersFactory;
@protocol ItemCreateControllersFactory;

@interface ItemCreateCoordinator : BaseCoordinator <ItemCreateCoordinatorOutput>

@property(nonatomic, copy) void(^onFinishFlow)(Item* item);

- (instancetype)initWithRouter:(id <Router>)router factory:(id <ItemCreateControllersFactory>)factory;


@end
