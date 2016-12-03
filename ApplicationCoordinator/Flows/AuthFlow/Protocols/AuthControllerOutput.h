//
// Created by Igor on 01/12/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

@protocol AuthControllerOutput <FlowControllerOutput>

@required
@property(nonatomic, copy) void(^onAuthorization)(BOOL isAuth);

@end
