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
#import "AuthCoordinatorBox.h"


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

    id <ItemsControllersFactory> factory = [[ControllerFactoryImp alloc] init];
    id <Coordinator, ItemCreateCoordinatorOutput> coordinator = [[ItemCreateCoordinator alloc] initWithRouter:routerImp
                                                                                                      factory:factory];

    coordinatorBox.coordinator = coordinator;
    coordinatorBox.viewController = routerImp.rootViewController;

    return coordinatorBox;
}

- (CreateCoordinatorBox *)createItemCreateCoordinatorBox {
    return [self createItemCreateCoordinatorBoxWith:nil];
}

- (AuthCoordinatorBox *)createAuthCoordinatorBoxWith:(UINavigationController *)navigationController {
    AuthCoordinatorBox *box = [[AuthCoordinatorBox alloc] init];

    RouterImp *routerImp = [[RouterImp alloc] initWithNavigationController:[self navigationControllerFrom:navigationController]];
    id <AuthControllersFactory> factory = [[ControllerFactoryImp alloc] init];
    id <Coordinator, AuthCoordinatorOutput> coordinator = [[AuthCoordinator alloc] initWithRouter:routerImp
                                                                                          factory:factory];

    box.viewController = routerImp.rootViewController;
    box.coordinator = coordinator;

    return box;
}

- (AuthCoordinatorBox *)createAuthCoordinatorBox {
    return [self createAuthCoordinatorBoxWith:nil];
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
