//
// Created by Igor on 26/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

typedef void(^NavigationBlock)(UINavigationController *navigationController);

@protocol TabbarFlowOutput <NSObject>

@property(nonatomic, copy) NavigationBlock itemFlowDidSelect;
@property(nonatomic, copy) NavigationBlock settingsFlowDidSelect;
@property(nonatomic, copy) NavigationBlock onViewDidLoad;

@end