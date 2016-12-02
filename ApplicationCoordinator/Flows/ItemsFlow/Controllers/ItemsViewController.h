//
//  ItemsViewController.h
//  ApplicationCoordinator
//
//  Created by Igor on 28/11/16.
//  Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "ItemsControllerOutput.h"

@interface ItemsViewController : UIViewController <ItemsControllerOutput>

@property(nonatomic, copy) EmptyBlock authNeeded;
@property(nonatomic, copy) EmptyBlock onCreate;
@property(nonatomic, copy) ListSelection onSelection;

@end
