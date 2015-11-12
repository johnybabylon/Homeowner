//
//  THTItem.m
//  RandomItems
//
//  Created by Johny Babylon on 11/11/15.
//  Copyright (c) 2015 Johny Babylon. All rights reserved.
//

#import "THTItem.h"

@implementation THTItem

+ (instancetype)randomItem
{
    NSArray *randomAdjectiveList = @[@"black", @"fat", @"myushi"];
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    
    // Get the index of a random adjective/noun from the lists
    // Note: The % operator, called the modulo operator, gives
    // you the remainder. So adjectiveIndex is a random number
    // from 0 to 2 inclusive.
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
                            [randomNounList objectAtIndex:nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    THTItem *newItem = [[self alloc] initWithName:randomName
                                       valueInDollars:randomValue
                                         serialNumber:randomSerialNumber];
    return newItem;



}

- (instancetype)initWithName:(NSString *)name
              valueInDollars:(int)value
                serialNumber:(NSString *)sNumber
{
    //Call the superclass's designater initializer
    self = [super init];
    
    if (self) {
        // give the iVariables values
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        _dateCreated = [[NSDate alloc] init];
    }
    
    return self;
}

- (instancetype)initWithName:(NSString *)name
{
    return [self initWithName:name
                   valueInDollars:0
                     serialNumber:@""];
}

- (instancetype)init
{
    return [self initWithName:@"Item"];
}



//Override description method
- (NSString *)description
{
    NSString *descriptionItem = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                                 self.itemName,
                                 self.serialNumber,
                                 self.valueInDollars,
                                 self.dateCreated];
    return descriptionItem;
}







@end
