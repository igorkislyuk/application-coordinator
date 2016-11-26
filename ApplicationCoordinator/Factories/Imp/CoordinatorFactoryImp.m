//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "CoordinatorFactoryImp.h"


@implementation CoordinatorFactoryImp {

}

- (BaseCoordinator *)createItemCoordinatorWith:(UINavigationController *)navigationController {
    return;
}

- (BaseCoordinator *)createItemCoordinator {
    return [self createItemCoordinatorWith:nil];
}

@end