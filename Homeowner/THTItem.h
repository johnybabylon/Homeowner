//
//  THTItem.h
//  RandomItems
//
//  Created by Johny Babylon on 11/11/15.
//  Copyright (c) 2015 Johny Babylon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THTItem : NSObject

+ (instancetype)randomItem;


- (instancetype)initWithName:(NSString *)name
              valueInDollars:(int)value
                serialNumber:(NSString *)sNumber;

- (instancetype)initWithName:(NSString *)name;


@property (nonatomic) NSString *itemName;
@property (nonatomic) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly) NSDate *dateCreated;

@end
