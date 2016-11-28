//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "CoordinatorFactoryImp.h"
#import "ItemCoordinator.h"
#import "ControllerFactoryImp.h"
#import "RouterImp.h"


@implementation CoordinatorFactoryImp {

}

- (BaseCoordinator *)createItemCoordinatorWith:(UINavigationController *)navigationController {
    CoordinatorFactoryImp *coordinatorFactoryImp = [[CoordinatorFactoryImp alloc] init];
    ControllerFactoryImp *controllerFactoryImp = [[ControllerFactoryImp alloc] init];
    RouterImp *routerImp = [[RouterImp alloc] initWithNavigationController:[[UINavigationController alloc] init]];
    BaseCoordinator *coordinator = [[ItemCoordinator alloc] initWithCoordinatorFactory:coordinatorFactoryImp
                                                                                router:routerImp
                                                                     controllerFactory:controllerFactoryImp];

    return coordinator;
}

- (BaseCoordinator *)createItemCoordinator {
    return [self createItemCoordinatorWith:nil];
}

@end