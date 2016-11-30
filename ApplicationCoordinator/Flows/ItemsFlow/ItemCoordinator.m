//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ItemCoordinator.h"
#import "CoordinatorFactory.h"
#import "Router.h"
#import "ItemListOutput.h"
#import "AuthFlowOutput.h"
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
    
    [self.router setRootController:[output toPresent]];

}

- (void)runAuthCoordinator {
    
    id <AuthFlowOutput, Coordinator> authCoord = [self.coordinatorFactory createAuthCoordinatorWith:self.router.navigationController];
    
    BlockWeakSelf weak = self;
    authCoord.finishFlow = ^{
        BlockStrongSelf strong = weak;
        BlockCheckStrongSelf(strong);
        
        [strong.router dismissControllerAnimated:YES completion:nil];
        [strong removeDependency:authCoord];
        
    };
    
    [self addDependency:authCoord];
    [authCoord start];

}

@end
