//
//  Car.h
//  InTheGarage
//
//  Created by Julien Guanzon on 2/26/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

static NSString * const CarRecordKey = @"car";
static NSString * const CarMakeKey = @"make";
static NSString * const CarModelKey = @"model";
static NSString * const CarYearKey = @"year";
static NSString * const CarIdentifierKey = @"identifier";

@interface Car : NSManagedObject

@property (nonatomic, retain) NSString * make;
@property (nonatomic, retain) NSString * model;
@property (nonatomic, retain) NSString * year;

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic) NSNumber *uploaded;

@end
