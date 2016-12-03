//
// Created by Igor on 03/12/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AuthCoordinatorOutput;

@interface AuthCoordinatorBox : NSObject

@property (nonatomic, strong) id <Coordinator, AuthCoordinatorOutput> coordinator;
@property (nonatomic, strong) __kindof UIViewController *viewController;

@end