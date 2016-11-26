//
//  Tabbar.m
//  ApplicationCoordinator
//
//  Created by Igor on 26/11/16.
//  Copyright © 2016 Igor Kislyuk. All rights reserved.
//

#import "Tabbar.h"

@interface Tabbar () <UITabBarControllerDelegate>

@end

@implementation Tabbar

- (void)viewDidLoad {
    [super viewDidLoad];

    self.delegate = self;

    //load controllers
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {



}


@end
