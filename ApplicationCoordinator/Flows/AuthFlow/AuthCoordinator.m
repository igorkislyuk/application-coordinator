//
// Created by Igor on 30/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "AuthCoordinator.h"
#import "AuthControllersFactory.h"
#import "Router.h"
#import "AuthControllerOutput.h"

@interface AuthCoordinator ()

@property (nonatomic, strong) id <AuthControllersFactory> factory;
@property (nonatomic, strong) id <Router> router;

@end

@implementation AuthCoordinator

- (instancetype)initWithRouter:(id <Router>)router factory:(id <AuthControllersFactory>)factory {
    self = [super init];
    
    if (self) {
        _router = router;
        _factory = factory;
    }
    
    return self;
}

- (void)start {
    [self showAuthController];
}

- (void)showAuthController {
    id <AuthControllerOutput> authController = [self.factory createAuthController];
    
    BlockWeakSelf weak = self;
    authController.authFinished = ^() {
        BlockStrongSelf strong = weak;
        BlockCheckStrongSelf(strong);
        
        if ([strong finishFlow]) {
            [strong finishFlow];
        }
    };
    
    [self.router present:[authController toPresent] animated:YES];
}



@end
