//
//  CarController.m
//  InTheGarage
//
//  Created by Caleb Hicks on 1/29/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "CarController.h"
#import "AppDelegate.h"



@implementation CarController

+ (CarController *)sharedInstance {
    static CarController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CarController new];
    });
    return sharedInstance;
}

-(NSArray *)cars {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Car"];
    return [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
}

-(NSManagedObjectContext *)managedObjectContext {
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
    
    return managedObjectContext;
}

- (void)save {
    
    [self.managedObjectContext save:nil];
    
}

-(void)addCarWithMake:(NSString *)make model:(NSString *)model year:(NSInteger)year andColor:(NSString *)color {
    
    Car *newCar = [NSEntityDescription insertNewObjectForEntityForName:@"Car" inManagedObjectContext:self.managedObjectContext];
    
    newCar.make = make;
    newCar.model = model;
    newCar.year = [NSNumber numberWithLong:year];
    newCar.color = color;
    
    [self addDriverWithName:@"Caleb Hicks" toCar:newCar];
    
    [self save];
}

-(void)addDriverWithName:(NSString *)name toCar:(Car *)car {
    
    Driver *driver = [NSEntityDescription insertNewObjectForEntityForName:@"Driver" inManagedObjectContext:self.managedObjectContext];
    driver.name = name;
    
    car.driver = driver;
    
    [self save];
}

-(void)removeCar:(Car *)car {
    
    [self.managedObjectContext deleteObject:car];
    
}

@end
