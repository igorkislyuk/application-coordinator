//
// Created by Igor on 28/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ItemListOutput;

@protocol ItemControllersFactory <NSObject>

@required
- (id <ItemListOutput>)createSimpleList;

@end