//
//  TabbarViewController.h
//  ApplicationCoordinator
//
//  Created by Igor on 26/11/16.
//  Copyright © 2016 Igor Kislyuk. All rights reserved.
//

#import "TabbarFlowOutput.h"

@interface TabbarViewController : UITabBarController <TabbarFlowOutput>

@property(nonatomic, copy) NavigationBlock itemFlowDidSelect;
@property(nonatomic, copy) NavigationBlock settingsFlowDidSelect;
@property(nonatomic, copy) NavigationBlock onViewDidLoad;

@end
