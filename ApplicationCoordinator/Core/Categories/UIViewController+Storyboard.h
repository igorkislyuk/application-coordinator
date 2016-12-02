//
// Created by Igor on 02/12/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIViewController (Storyboard)

+ (__kindof UIViewController *)controllerFromStoryboard:(StoryboardEnum)storyboard;

+ (__kindof UIViewController *)controllerInStoryboard:(UIStoryboard *)storyboard identifier:(NSString *)identifier;

+ (__kindof UIViewController *)controllerInStoryboard:(UIStoryboard *)storyboard;

@end