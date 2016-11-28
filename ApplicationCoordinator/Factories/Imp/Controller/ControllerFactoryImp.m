//
// Created by Igor on 28/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ControllerFactoryImp.h"
#import "ItemListOutput.h"
#import "SimpleListViewController.h"


@implementation ControllerFactoryImp

- (id <ItemListOutput>)createSimpleList {

    id <ItemListOutput> output = [[SimpleListViewController alloc] initWithNibName:NSStringFromClass([SimpleListViewController class]) bundle:nil];

    return output;
}


@end