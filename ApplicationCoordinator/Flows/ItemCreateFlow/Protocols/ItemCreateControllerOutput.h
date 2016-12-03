//
// Created by Igor on 03/12/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

@class Item;

@protocol ItemCreateControllerOutput <FlowControllerOutput>

@property(nonatomic, copy) EmptyBlock onHide;
@property(nonatomic, copy) void(^onItemCreate)(Item* item);


@end