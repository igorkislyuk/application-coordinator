//
// Created by Igor on 03/12/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

@class Item;

@protocol ItemCreateCoordinatorOutput <NSObject>

@property(nonatomic, copy) void(^onFinishFlow)(Item* item);

@end