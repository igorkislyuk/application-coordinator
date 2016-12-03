//
// Created by Igor on 28/11/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

@protocol Presentable <NSObject>

@required
- (UIViewController *)toPresent;

@end

@protocol FlowControllerOutput <Presentable>
@end
