//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ItemCoordinator.h"
#import "CoordinatorFactory.h"
#import "Router.h"
#import "Protocols/ItemListOutput.h"
#import "ItemControllersFactory.h"

@interface ItemCoordinator ()

@property (nonatomic, strong) id <CoordinatorFactory> coordinatorFactory;
@property (nonatomic, strong) id <Router> router;
@property (nonatomic, strong) id <ItemControllersFactory> factory;

@end

@implementation ItemCoordinator {

}

- (instancetype)initWithCoordinatorFactory:(id <CoordinatorFactory>)coordinatorFactory router:(id <Router>)router controllerFactory:(id <ItemControllersFactory>)factory {
    self = [super init];
    if (self) {
        _coordinatorFactory = coordinatorFactory;
        _router = router;
        _factory = factory;
    }

    return self;
}

- (void)start {
    [self showList];
}

- (void)showList {

    id <ItemListOutput> output = [self.factory createList];

    BlockWeakSelf weakSelf = self;
    output.authNeeded = ^{
        BlockStrongSelf strongSelf = weakSelf;
        BlockCheckStrongSelf(strongSelf);

        [strongSelf runAuthCoordinator];
    };


    [self.router setRootController:output];

}

- (void)runAuthCoordinator {

}

@end