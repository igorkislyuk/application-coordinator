//
// Created by Igor on 03/12/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ItemCreateControllerOutput;

@protocol ItemCreateControllersFactory <NSObject>

- (id <ItemCreateControllerOutput>)createItemCreateOutput;

@end