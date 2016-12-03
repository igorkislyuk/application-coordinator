//
// Created by Igor on 30/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AuthCoordinatorOutput <NSObject>

@required
@property(nonatomic, copy) EmptyBlock finishFlow;

@end
