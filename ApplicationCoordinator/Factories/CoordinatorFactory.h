//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Coordinator;
@class BaseCoordinator;

@protocol CoordinatorFactory <NSObject>

@required
- (BaseCoordinator *)createItemCoordinatorWith:(UINavigationController *)navigationController;
- (BaseCoordinator *)createItemCoordinator;


@end