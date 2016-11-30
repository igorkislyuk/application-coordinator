//
// Created by Igor on 30/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AuthFlowOutput <NSObject>

@required
@property(nonatomic, copy) EmptyBlock authFinished;

@end