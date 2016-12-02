//
// Created by Igor on 28/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ControllerFactoryImp.h"
#import "SimpleListViewController.h"
#import "AuthViewController.h"
#import "ItemListOutput.h"
#import "SettingsControllerOutput.h"
#import "SettingsViewController.h"
#import "SettingsDetailViewController.h"


@implementation ControllerFactoryImp

- (id <ItemListOutput>)createList {

    id <ItemListOutput> output = [[SimpleListViewController alloc] initWithNibName:NSStringFromClass([SimpleListViewController class]) bundle:nil];

    return output;
}

- (id <AuthControllerOutput>)createAuthController {
    id <AuthControllerOutput> output = [[AuthViewController alloc] initWithNibName:NSStringFromClass([AuthViewController class]) bundle:nil];
    return output;
}

#pragma mark - Settings

- (id <SettingsControllerOutput>)createSettingsOutput {
    id <SettingsControllerOutput> output = [SettingsViewController controllerFromStoryboard:StoryboardEnumSettings];
    return output;
}

- (id <SettingsDetailControllerOutput>)createSettingsDetailOutput {
    id <SettingsDetailControllerOutput> output = [SettingsDetailViewController controllerFromStoryboard:StoryboardEnumSettings];
    return output;
}


@end
