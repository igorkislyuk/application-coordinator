//
// Created by Igor on 28/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ItemsControllerOutput;

@protocol ItemControllersFactory <NSObject>

@required
- (id <ItemsControllerOutput>)createList;

@end