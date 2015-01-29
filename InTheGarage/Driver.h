//
//  Driver.h
//  InTheGarage
//
//  Created by Caleb Hicks on 1/29/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Car;

@interface Driver : NSManagedObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSOrderedSet *cars;
@end

@interface Driver (CoreDataGeneratedAccessors)

- (void)insertObject:(Car *)value inCarsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromCarsAtIndex:(NSUInteger)idx;
- (void)insertCars:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeCarsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInCarsAtIndex:(NSUInteger)idx withObject:(Car *)value;
- (void)replaceCarsAtIndexes:(NSIndexSet *)indexes withCars:(NSArray *)values;
- (void)addCarsObject:(Car *)value;
- (void)removeCarsObject:(Car *)value;
- (void)addCars:(NSOrderedSet *)values;
- (void)removeCars:(NSOrderedSet *)values;
@end
