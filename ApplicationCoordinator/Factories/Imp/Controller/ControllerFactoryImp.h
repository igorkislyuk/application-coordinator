//
// Created by Igor on 28/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ItemsControllersFactory.h"
#import "AuthControllersFactory.h"
#import "SettingsControllerFactory.h"
#import "ItemCreateControllersFactory.h"

@interface ControllerFactoryImp : NSObject <
        ItemsControllersFactory,
        AuthControllersFactory,
        SettingsControllerFactory,
        ItemCreateControllersFactory>

@end