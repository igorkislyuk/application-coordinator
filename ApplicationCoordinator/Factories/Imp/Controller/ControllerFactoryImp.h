//
// Created by Igor on 28/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ItemControllersFactory.h"
#import "AuthControllersFactory.h"

@interface ControllerFactoryImp : NSObject <
        ItemControllersFactory,
        AuthControllersFactory>

@end