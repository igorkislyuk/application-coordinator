//
//  Blocks.h
//  ApplicationCoordinator
//
//  Created by Igor on 01/12/16.
//  Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#ifndef Blocks_h
#define Blocks_h

#define BlockWeakObject(o) __typeof(o) __weak
#define BlockWeakSelf BlockWeakObject(self)

#define BlockStrongObject(o) __strong __typeof(o)
#define BlockStrongSelf BlockStrongObject(self)
#define BlockCheckStrongSelf(o) if (o == nil) {return;}

#endif /* Blocks_h */
