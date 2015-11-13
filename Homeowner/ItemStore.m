//
//  ItemStore.m
//  Homeowner
//
//  Created by Johny Babylon on 11/11/15.
//  Copyright (c) 2015 Johny Babylon. All rights reserved.
//

#import "ItemStore.h"
#import "THTItem.h"

@interface ItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation ItemStore

+ (instancetype)sharedStore
{
    static ItemStore *sharedStore;
    
    // Do I need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

// If a programmer calls [[BNRItemStore alloc] init], let him
// know the error of his ways
- (instancetype)init
{
    [NSException raise:@"Singleton"
                format:@"Use + [ItemStore sharedStore]"];
    return nil;
}

// The real initializer
- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _privateItems =[[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)allItems
{
    return [self.privateItems copy];
}

- (THTItem *)createItem
{
    THTItem *item = [THTItem randomItem];
    
    [self.privateItems addObject:item];
    
    return item;
}

- (void)removeItem:(THTItem *)item
{
    [self.privateItems removeObjectIdenticalTo:item];
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if (fromIndex == toIndex) {
        return;
    }
    
    THTItem *item = self.privateItems[fromIndex];
    [self.privateItems removeObjectAtIndex:fromIndex];
    [self.privateItems insertObject:item atIndex:toIndex];
}














@end
