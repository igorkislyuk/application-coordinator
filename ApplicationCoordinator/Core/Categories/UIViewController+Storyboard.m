//
// Created by Igor on 02/12/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

@implementation UIViewController (Storyboard)

+ (__kindof UIViewController *)instantiateControllerFromStoryboard:(UIStoryboard *)storyboard identifier:(NSString *)identifier {
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}

+ (__kindof UIViewController *)controllerFromStoryboard:(StoryboardEnum)storyboard {
    NSString *storyboardName = @"Main";
    switch (storyboard) {

        case StoryboardEnumMain:
            storyboardName = @"Main";
            break;
        case StoryboardEnumSettings:
            storyboardName = @"Settings";
            break;
    }

    return [self instantiateControllerFromStoryboard:[UIStoryboard storyboardWithName:storyboardName bundle:nil] identifier:NSStringFromClass([self class])];
}

+ (__kindof UIViewController *)controllerInStoryboard:(UIStoryboard *)storyboard identifier:(NSString *)identifier {
    return [self instantiateControllerFromStoryboard:storyboard identifier:identifier];
}

+ (__kindof UIViewController *)controllerInStoryboard:(UIStoryboard *)storyboard {
    return [self instantiateControllerFromStoryboard:storyboard identifier:NSStringFromClass([self class])];
}


@end