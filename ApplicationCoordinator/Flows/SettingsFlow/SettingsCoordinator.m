//
// Created by Igor on 02/12/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "SettingsCoordinator.h"
#import "SettingsControllerFactory.h"
#import "Protocols/SettingsControllerOutput.h"
#import "SettingsDetailControllerOutput.h"

@interface SettingsCoordinator ()
@property (nonatomic, strong) id <Router> router;
@property (nonatomic, strong) id <SettingsControllerFactory> factory;
@end

@implementation SettingsCoordinator

- (instancetype)initWithFactory:(id <SettingsControllerFactory>)factory router:(id <Router>)router {

    self = [super init];
    if (self) {
        _factory = factory;
        _router = router;
    }

    return self;
}

- (void)start {

    [self showSettings];

}

- (void)showSettings {

    id <SettingsControllerOutput> settings = [self.factory createSettingsOutput];

    BlockWeakSelf weak = self;
    settings.showDetailedSettings = ^(SettingsItem *item) {
        BlockStrongSelf strong = weak;
        BlockCheckStrongSelf(strong);

        //show detailed
        id <SettingsDetailControllerOutput> detail = [self.factory createSettingsDetailOutputWith:item];
        [strong.router push:[detail toPresent]];
    };

    [self.router setRootController:[settings toPresent]];
}


@end
