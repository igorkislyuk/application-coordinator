//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseCoordinator.h"

@protocol CoordinatorFactory;
@protocol TabbarFlowOutput;

@interface ApplicationCoordinator : BaseCoordinator

@property (nonatomic, strong) id <TabbarFlowOutput> tabbar;

- (instancetype)initWithCoordinatorFactory:(id <CoordinatorFactory>)coordinatorFactory;

- (instancetype)initWithTabbar:(id <TabbarFlowOutput>)tabbar coordinatorFactory:(id <CoordinatorFactory>)coordinatorFactory;


@end
