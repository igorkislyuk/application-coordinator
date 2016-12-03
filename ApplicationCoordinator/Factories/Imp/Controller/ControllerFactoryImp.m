//
// Created by Igor on 28/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ControllerFactoryImp.h"
#import "ItemsViewController.h"
#import "AuthViewController.h"
#import "ItemsControllerOutput.h"
#import "SettingsControllerOutput.h"
#import "SettingsViewController.h"
#import "SettingsDetailViewController.h"
#import "ItemCreateViewController.h"
#import "ItemDetailViewController.h"
#import "ItemDetailControllerOutput.h"


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

- (id <SettingsDetailControllerOutput>)createSettingsDetailOutput {

    return [SettingsDetailViewController controllerFromStoryboard:StoryboardEnumSettings];
}

- (id <ItemCreateControllerOutput>)createItemCreateOutput {

    return [ItemCreateViewController controllerFromStoryboard:StoryboardEnumItemCreate];
}


@end
