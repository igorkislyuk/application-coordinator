//
// Created by Igor on 28/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlowControllerOutput.h"

@class Item;
typedef void(^ListSelection)(Item *itemList);

@protocol ItemsControllerOutput <FlowControllerOutput>

@property(nonatomic, copy) EmptyBlock authNeeded;
@property(nonatomic, copy) EmptyBlock onCreate;
@property(nonatomic, copy) ListSelection onSelection;

@end
