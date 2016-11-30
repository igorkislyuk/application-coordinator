//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "CoordinatorFactoryImp.h"
#import "ItemCoordinator.h"
#import "ControllerFactoryImp.h"
#import "RouterImp.h"
#import "AuthCoordinator.h"
#import "AuthControllersFactory.h"


@implementation CoordinatorFactoryImp {

}

- (BaseCoordinator *)createItemCoordinatorWith:(UINavigationController *)navigationController {
    
    CoordinatorFactoryImp *coordinatorFactoryImp = [[CoordinatorFactoryImp alloc] init];
    ControllerFactoryImp *controllerFactoryImp = [[ControllerFactoryImp alloc] init];
    RouterImp *routerImp = [[RouterImp alloc] initWithNavigationController:navigationController];
    BaseCoordinator *coordinator = [[ItemCoordinator alloc] initWithCoordinatorFactory:coordinatorFactoryImp
                                                                                router:routerImp
                                                                     controllerFactory:controllerFactoryImp];

    return coordinator;
}

- (BaseCoordinator *)createItemCoordinator {
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

@end
