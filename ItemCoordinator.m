//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ItemCoordinator.h"
#import "CoordinatorFactory.h"
#import "Router.h"

@interface ItemCoordinator ()

@property (nonatomic, strong) id <CoordinatorFactory> coordinatorFactory;
@property (nonatomic, strong) id <Router> router;
//@property (nonatomic, strong) id <ItemControllersFactory> factory;

@end

@implementation ItemCoordinator {

}

- (instancetype)initWithCoordinatorFactory:(id <CoordinatorFactory>)coordinatorFactory router:(id <Router>)router {
    self = [super init];
    if (self) {
        _coordinatorFactory = coordinatorFactory;
        _router = router;
    }

    return self;
}

- (void)start {
    [self showInitialController];
}

- (void)showInitialController {



}


@end