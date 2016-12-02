//
//  BaseCoordinator.m
//  ApplicationCoordinator
//
//  Created by Igor on 26/11/16.
//  Copyright © 2016 Igor Kislyuk. All rights reserved.
//

#import "BaseCoordinator.h"
#import "ItemCreateCoordinatorOutput.h"
#import "CreateCoordinatorBox.h"

@interface BaseCoordinator ()

@end

@implementation BaseCoordinator {
    NSMutableSet <BaseCoordinator *> *_childs;
}

- (void)start {
    NSLog(@"Method should be overriden");
    abort();
}

//add only unique object
- (void)addDependency:(BaseCoordinator *)coordinator {

    if (![_childs containsObject:coordinator]) {
        [_childs addObject:coordinator];
    }

}

- (void)removeDependency:(BaseCoordinator *)coordinator {
    if ([_childs containsObject:coordinator]) {
        [_childs removeObject:coordinator];
    }
}

- (NSSet <BaseCoordinator *> *)childCoordinators {
    if (_childs == nil) {
        _childs = [[NSMutableSet alloc] init];
    }
    return _childs;
}

@end
