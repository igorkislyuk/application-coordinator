//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "CoordinatorFactoryImp.h"
#import "ItemsCoordinator.h"
#import "ControllerFactoryImp.h"
#import "RouterImp.h"
#import "AuthCoordinator.h"
#import "AuthControllersFactory.h"
#import "SettingsCoordinator.h"
#import "CreateCoordinatorBox.h"
#import "ItemCreateCoordinator.h"


@implementation CoordinatorFactoryImp

- (id <Coordinator>)createItemCoordinatorWith:(UINavigationController *)navigationController {
    
    CoordinatorFactoryImp *coordinatorFactoryImp = [[CoordinatorFactoryImp alloc] init];
    ControllerFactoryImp *controllerFactoryImp = [[ControllerFactoryImp alloc] init];
    RouterImp *routerImp = [[RouterImp alloc] initWithNavigationController:navigationController];
    BaseCoordinator *coordinator = [[ItemsCoordinator alloc] initWithCoordinatorFactory:coordinatorFactoryImp
                                                                                router:routerImp
                                                                     controllerFactory:controllerFactoryImp];

    return coordinator;
}

- (id <Coordinator>)createItemCoordinator {
    return [self createItemCoordinatorWith:nil];
}

- (id <AuthFlowOutput, Coordinator>)createAuthCoordinatorWith:(UINavigationController *)navigationController {
    
    RouterImp *router = [[RouterImp alloc] initWithNavigationController:navigationController];
    ControllerFactoryImp *controllerFactoryImp = [[ControllerFactoryImp alloc] init];
    id <AuthFlowOutput, Coordinator> coordinator = [[AuthCoordinator alloc] initWithRouter:router factory:controllerFactoryImp];
    return coordinator;
}

- (id <AuthFlowOutput, Coordinator>)createAuthCoordinator {

    return [self createAuthCoordinatorWith:nil];
}

- (id <Coordinator>)createSettingCoordinatorWith:(UINavigationController *)navigationController {

    RouterImp *routerImp = [[RouterImp alloc] initWithNavigationController:[self navigationControllerFrom:navigationController]];
    id <SettingsControllerFactory> factory = [[ControllerFactoryImp alloc] init];
    SettingsCoordinator *settingsCoordinator = [[SettingsCoordinator alloc] initWithFactory:factory router:routerImp];
    return settingsCoordinator;
}

- (id <Coordinator>)createSettingsCoordinator {

    return [self createSettingCoordinatorWith:nil];
}

- (CreateCoordinatorBox *)createItemCreateCoordinatorBoxWith:(UINavigationController *)navigationController {
    CreateCoordinatorBox *coordinatorBox = [[CreateCoordinatorBox alloc] init];

    RouterImp *routerImp = [[RouterImp alloc] initWithNavigationController:[self navigationControllerFrom:navigationController]];

    id <Coordinator, ItemCreateCoordinatorOutput> coordinator = [[ItemCreateCoordinator alloc] ini]


    return coordinatorBox;
}

- (CreateCoordinatorBox *)createItemCreateCoordinatorBox {
    return [self createItemCreateCoordinatorBoxWith:nil];
}


#pragma mark - Private

- (UINavigationController *)navigationControllerFrom:(UINavigationController *)navigationController {

    if (navigationController != nil) {
        return navigationController;
    } else {
        return [UINavigationController controllerFromStoryboard:StoryboardEnumMain];
    }
}


@end
