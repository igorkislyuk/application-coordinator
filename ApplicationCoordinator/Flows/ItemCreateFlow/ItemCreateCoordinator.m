//
// Created by Igor on 03/12/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ItemCreateCoordinator.h"
#import "ItemsControllersFactory.h"
#import "ItemCreateControllerOutput.h"
#import "ItemCreateControllersFactory.h"

@interface ItemCreateCoordinator ()

@property (nonatomic, strong) id <Router> router;
@property (nonatomic, strong) id <ItemCreateControllersFactory> factory;

@end

@implementation ItemCreateCoordinator

- (instancetype)initWithRouter:(id <Router>)router factory:(id <ItemCreateControllersFactory>)factory {
    self = [super init];
    if (self) {
        _router = router;
        _factory = factory;
    }

    return self;
}

- (void)start {

    [self runCreateItemController];

}

- (void)runCreateItemController {

    id <ItemCreateControllerOutput> output = [self.factory createItemCreateOutput];

    BlockWeakSelf weak = self;
    output.onHide = ^() {

        BlockStrongSelf strong = weak;

        if (strong.onFinishFlow) {
            strong.onFinishFlow(nil);
        }
    };

    output.onItemCreate = ^(Item *item) {

        BlockStrongSelf strong = weak;

        if (strong.onFinishFlow) {
            strong.onFinishFlow(item);
        }
    };

    [self.router setRootController:[output toPresent]];

}


@end
