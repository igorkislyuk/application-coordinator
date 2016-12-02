//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ItemsCoordinator.h"
#import "CoordinatorFactory.h"
#import "Router.h"
#import "ItemsControllerOutput.h"
#import "AuthFlowOutput.h"
#import "ItemsControllersFactory.h"
#import "CreateCoordinatorBox.h"
#import "ItemCreateCoordinatorOutput.h"

@interface ItemsCoordinator ()

@property (nonatomic, strong) id <CoordinatorFactory> coordinatorFactory;
@property (nonatomic, strong) id <Router> router;
@property (nonatomic, strong) id <ItemsControllersFactory> factory;

@end

@implementation ItemsCoordinator {

}

- (instancetype)initWithCoordinatorFactory:(id <CoordinatorFactory>)coordinatorFactory router:(id <Router>)router controllerFactory:(id <ItemsControllersFactory>)factory {
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

    id <ItemsControllerOutput> output = [self.factory createList];
//    output.authNeeded = ^{
//        BlockStrongSelf strongSelf = weakSelf;
//        BlockCheckStrongSelf(strongSelf);
//
//        [strongSelf runAuthCoordinator];
//    };
//
//    output.onSelection = ^(Item *itemList){
//
//    };

    // TODO: - fix here what happens to weak ref. For fast setup, will use strong ref
    output.onCreate = ^{
        
        [self runItemCreateCoordinator];
    };
    
    [self.router setRootController:[output toPresent]];
    
}

- (void)runAuthCoordinator {
    
    id <AuthFlowOutput, Coordinator> authCoord = [self.coordinatorFactory createAuthCoordinatorWith:self.router.rootViewController];
    
    BlockWeakSelf weak = self;
    BlockWeakObject(authCoord) weakCoord = authCoord;
    authCoord.finishFlow = ^{
        BlockStrongSelf strong = weak;
        BlockCheckStrongSelf(strong);
        
        BlockStrongObject(weakCoord) strongCoord = weakCoord;
        BlockCheckStrongSelf(strongCoord);
        
        [strong.router dismissControllerAnimated:YES completion:nil];
        [strong removeDependency:strongCoord];
        
    };
    
    [self addDependency:authCoord];
    [authCoord start];

}

- (void)runItemCreateCoordinator {

    CreateCoordinatorBox *coordinatorBox = [self.coordinatorFactory createItemCreateCoordinatorBox];

    id <Coordinator, ItemCreateCoordinatorOutput> coordinator = coordinatorBox.coordinator;

    BlockWeakSelf weakSelf = self;
    coordinator.onFinishFlow = ^(Item* item) {
        BlockStrongSelf strong = weakSelf;
        BlockCheckStrongSelf(strong);

        [strong.router dismissController];
        [strong removeDependency:coordinatorBox.coordinator];

        if (item) {
            [strong runShowItemDetails:item];
        }

    };

    [self addDependency:coordinator];
    [self.router present:coordinatorBox.viewController];
    [coordinator start];


}

- (void)runShowItemDetails:(Item *)item {

}

@end
