//
//  main.m
//  ApplicationCoordinator
//
//  Created by Igor on 26/11/16.
//  Copyright © 2016 Igor Kislyuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <objc/objc.h>
#import <objc/runtime.h>

#import "AppDelegate.h"

id ViewControllerToPresentIMP(id self, SEL _cmd) {
    return self;
}

void addToPresent() {
//    char signature[10] = @encode(id);
    NSString *signature = [NSString stringWithFormat:@"%s%s%s", @encode(id), @encode(id), @encode(SEL)];
    class_addMethod([UIViewController class], @selector(toPresent), (IMP)ViewControllerToPresentIMP, [signature cStringUsingEncoding:NSUTF8StringEncoding]);
}

int main(int argc, char * argv[]) {
    @autoreleasepool {
        addToPresent();
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
