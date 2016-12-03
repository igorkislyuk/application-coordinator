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
#import "AuthCoordinatorBox.h"

@interface BaseCoordinator ()

@end

@implementation BaseCoordinator {
    NSMutableSet <id <Coordinator> > *_childs;
}

- (void)start {
    NSLog(@"Method should be overriden");
    abort();
}

//add only unique object
- (void)addDependency:(id <Coordinator>)coordinator {

    if (![_childs containsObject:coordinator]) {
        [_childs addObject:coordinator];
    }

}

- (void)removeDependency:(id <Coordinator>)coordinator {
    if ([_childs containsObject:coordinator]) {
        [_childs removeObject:coordinator];
    }
}

- (NSSet <id <Coordinator> > *)childCoordinators {
    if (_childs == nil) {
        _childs = [[NSMutableSet alloc] init];
    }
    return _childs;
}

@end
