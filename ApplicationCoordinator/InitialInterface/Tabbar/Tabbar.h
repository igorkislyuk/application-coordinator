//
//  Tabbar.h
//  ApplicationCoordinator
//
//  Created by Igor on 26/11/16.
//  Copyright © 2016 Igor Kislyuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabbarFlowOutput.h"

@interface Tabbar : UITabBarController <TabbarFlowOutput>

@property(nonatomic, copy) NavigationBlock itemFlowDidSelect;
@property(nonatomic, copy) NavigationBlock settingsFlowDidSelect;
@property(nonatomic, copy) NavigationBlock viewDidLoad;

@end
