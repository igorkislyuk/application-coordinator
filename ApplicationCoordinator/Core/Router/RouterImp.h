//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Router.h"


@interface RouterImp : NSObject <Router>

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController;

@end