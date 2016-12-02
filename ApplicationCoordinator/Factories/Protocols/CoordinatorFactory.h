//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Coordinator, AuthFlowOutput;
@class BaseCoordinator;
@protocol ItemCreateCoordinatorOutput;

@protocol CoordinatorFactory <NSObject>

@required
- (BaseCoordinator *)createItemCoordinatorWith:(UINavigationController *)navigationController;
- (BaseCoordinator *)createItemCoordinator;

@required
- (id <AuthFlowOutput, Coordinator>)createAuthCoordinatorWith:(UINavigationController *)navigationController;
- (id <AuthFlowOutput, Coordinator>)createAuthCoordinator;

@required
- (id <Coordinator>)createSettingCoordinatorWith:(UINavigationController *)navigationController;
- (id <Coordinator>)createSettingsCoordinator;

@required
- (id <Coordinator, ItemCreateCoordinatorOutput>)create;

@end
