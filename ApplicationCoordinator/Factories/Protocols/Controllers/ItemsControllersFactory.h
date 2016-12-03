//
// Created by Igor on 28/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

@class Item;
@protocol ItemsControllerOutput, ItemDetailControllerOutput;

@protocol ItemsControllersFactory <NSObject>

@required
- (id <ItemsControllerOutput>)createItemOutput;

- (id <ItemDetailControllerOutput>)createDetailOutput:(Item *)item;

@end