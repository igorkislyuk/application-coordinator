//
//  AuthViewController.h
//  ApplicationCoordinator
//
//  Created by Igor on 30/11/16.
//  Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "AuthControllerOutput.h"

@interface AuthViewController : UIViewController <AuthControllerOutput>

@property(nonatomic, copy) EmptyBlock authFinished;

@end
