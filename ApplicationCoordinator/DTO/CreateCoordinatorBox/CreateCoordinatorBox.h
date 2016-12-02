//
// Created by Igor on 03/12/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

@protocol ItemCreateCoordinatorOutput;

@interface CreateCoordinatorBox : NSObject

@property (nonatomic, strong) id <Coordinator, ItemCreateCoordinatorOutput> coordinator;
@property (nonatomic, strong) __kindof UIViewController *viewController;

@end