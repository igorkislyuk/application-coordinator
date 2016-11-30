//
// Created by Igor on 30/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseCoordinator.h"
#import "AuthFlowOutput.h"


@interface AuthCoordinator : BaseCoordinator <AuthFlowOutput>

@property(nonatomic, copy) EmptyBlock authFinished;

@end