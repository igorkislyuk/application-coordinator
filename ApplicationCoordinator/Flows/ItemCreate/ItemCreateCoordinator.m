//
// Created by Igor on 03/12/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ItemCreateCoordinator.h"
#import "ItemsControllersFactory.h"

@interface ItemCreateCoordinator ()

@property (nonatomic, strong) id <Router> router;
@property (nonatomic, strong) id <ItemsControllersFactory> factory;

@end

@implementation ItemCreateCoordinator

- (instancetype)initWithRouter:(id <Router>)router factory:(id <ItemsControllersFactory>)factory {
    self = [super init];
    if (self) {
        _router = router;
        _factory = factory;
    }

    return self;
}

- (void)start {



}


@end