//
// Created by Igor on 02/12/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

@implementation UIViewController (Storyboard)

+ (__kindof UIViewController *)instantiateControllerFromStoryboard:(UIStoryboard *)storyboard identifier:(NSString *)identifier {
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}

+ (__kindof UIViewController *)controllerFromStoryboard:(StoryboardEnum)storyboard {
    NSString *storyboardName = nil;
    switch (storyboard) {

        case StoryboardEnumMain:
            storyboardName = @"Main"; break;
        case StoryboardEnumSettings:
            storyboardName = @"Settings"; break;
        case StoryboardEnumItems:
            storyboardName = @"Items"; break;
        case StoryboardEnumItemCreate:
            storyboardName = @"ItemCreate"; break;
        case StoryboardEnumAuthorization:
            storyboardName = @"Authorization"; break;
        default:
            NSLog(@"Not handled this situation");
            abort();

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
