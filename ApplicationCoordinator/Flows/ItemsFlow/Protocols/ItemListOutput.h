//
// Created by Igor on 28/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlowControllerOutput.h"

@class ItemList;
typedef void(^ListSelection)(ItemList *itemList);

@protocol ItemListOutput <FlowControllerOutput>

@property(nonatomic, copy) EmptyBlock authNeeded;
@property(nonatomic, copy) EmptyBlock onCreate;
@property(nonatomic, copy) ListSelection onSelection;

@end
