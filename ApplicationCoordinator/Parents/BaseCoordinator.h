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

@property (nonatomic, strong, readonly) NSSet <BaseCoordinator *> *childCoordinators;

- (void)addDependency:(BaseCoordinator *)coordinator;

- (void)removeDependency:(BaseCoordinator *)coordinator;

@end
