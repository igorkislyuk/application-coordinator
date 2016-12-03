//
// Created by Igor on 30/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "AuthCoordinator.h"

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
    [self runAuthController];
}

- (void)runAuthController {
    id <AuthControllerOutput> authController = [self.factory createAuthOutput];
    
    authController.onAuthorization = ^(BOOL isAuth) {
    
        if (self.finishFlow) {
            self.finishFlow();
        }
    };

    [self.router setRootController:[authController toPresent]];
}



@end
