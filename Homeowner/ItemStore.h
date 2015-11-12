//
//  ItemStore.h
//  Homeowner
//
//  Created by Johny Babylon on 11/11/15.
//  Copyright (c) 2015 Johny Babylon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class THTItem;

@interface ItemStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allItems;

+ (instancetype)sharedStore;
- (THTItem *)createItem;

@end
