//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ItemsCoordinator.h"
#import "CoordinatorFactory.h"
#import "ItemsControllerOutput.h"
#import "AuthCoordinatorOutput.h"
#import "ItemsControllersFactory.h"
#import "CreateCoordinatorBox.h"
#import "ItemCreateCoordinatorOutput.h"
#import "ItemDetailControllerOutput.h"
#import "AuthCoordinatorBox.h"

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

    id <ItemsControllerOutput> output = [self.factory createItemOutput];
    // TODO: - fix here what happens to weak ref. For fast setup, will use strong ref

    output.authNeeded = ^{

        [self runAuthCoordinator];
    };

    output.onSelection = ^(Item *item){

        [self runShowItemDetails:item];
    };

    output.onCreate = ^{
        
        [self runItemCreateCoordinator];
    };
    
    [self.router setRootController:[output toPresent]];
    
}

- (void)runAuthCoordinator {
    
    AuthCoordinatorBox *box = [self.coordinatorFactory createAuthCoordinatorBox];
    
    id <Coordinator, AuthCoordinatorOutput> coordinator = box.coordinator;

    BlockWeakSelf weak = self;
    BlockWeakObject(coordinator) weakCoord = coordinator;
    coordinator.finishFlow = ^{
        BlockStrongSelf strong = weak;
        BlockCheckStrongSelf(strong);

        BlockStrongObject(weakCoord) strongCoord = weakCoord;
        BlockCheckStrongSelf(strongCoord);

        [strong.router dismissControllerAnimated:YES completion:nil];
        [strong removeDependency:strongCoord];

    };

    [self addDependency:coordinator];
    [self.router present:box.viewController];
    [coordinator start];

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

    id <ItemDetailControllerOutput> output = [self.factory createDetailOutput:item];

    [self.router push:[output toPresent]];

}

@end
