//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

@protocol CoordinatorFactory, TabbarFlowOutput;

@interface ApplicationCoordinator : BaseCoordinator

@property (nonatomic, strong) id <TabbarFlowOutput> tabbar;

- (instancetype)initWithTabbar:(id <TabbarFlowOutput>)tabbar coordinatorFactory:(id <CoordinatorFactory>)coordinatorFactory;


@end
