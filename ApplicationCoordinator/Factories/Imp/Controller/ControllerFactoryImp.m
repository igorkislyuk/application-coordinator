//
// Created by Igor on 28/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ControllerFactoryImp.h"

#import "ItemsViewController.h"
#import "ItemDetailControllerOutput.h"
#import "ItemDetailViewController.h"

#import "ItemCreateViewController.h"

#import "AuthViewController.h"

#import "SettingsControllerOutput.h"
#import "SettingsViewController.h"
#import "SettingsDetailViewController.h"


@implementation ControllerFactoryImp

- (id <ItemsControllerOutput>)createItemOutput {

    return [ItemsViewController controllerFromStoryboard:StoryboardEnumItems];
}

- (id <ItemDetailControllerOutput>)createDetailOutput:(Item *)item {

    return [ItemDetailViewController controllerFromStoryboard:StoryboardEnumItems];
}


- (id <AuthControllerOutput>)createAuthOutput {

    return [AuthViewController controllerFromStoryboard:StoryboardEnumAuthorization];
}

#pragma mark - Settings

- (id <SettingsControllerOutput>)createSettingsOutput {

    return [SettingsViewController controllerFromStoryboard:StoryboardEnumSettings];
}

- (id <SettingsDetailControllerOutput>)createSettingsDetailOutputWith:(SettingsItem *)settingsItem {

    SettingsDetailViewController *controller = [SettingsDetailViewController controllerFromStoryboard:StoryboardEnumSettings];
    controller.item = settingsItem;
    return controller;
}

- (id <ItemCreateControllerOutput>)createItemCreateOutput {

    return [ItemCreateViewController controllerFromStoryboard:StoryboardEnumItemCreate];
}


@end
