//
//  BaseCoordinator.h
//  ApplicationCoordinator
//
//  Created by Igor on 26/11/16.
//  Copyright © 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Coordinator.h"

@interface BaseCoordinator : NSObject <Coordinator>

@property (nonatomic, strong, readonly) NSSet <id <Coordinator> > *childCoordinators;

- (void)addDependency:(id <Coordinator>)coordinator;

- (void)removeDependency:(id <Coordinator>)coordinator;

@end
