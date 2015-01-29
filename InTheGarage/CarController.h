//
//  CarController.h
//  InTheGarage
//
//  Created by Caleb Hicks on 1/29/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Driver.h"

@interface CarController : NSObject

+ (CarController *)sharedInstance;

-(NSArray *)cars;

-(void)addCarWithMake:(NSString *)make model:(NSString *)model year:(NSInteger)year andColor:(NSString *)color;

-(void)addDriverWithName:(NSString *)name toCar:(Car *)car;

-(void)removeCar:(Car *)car;

-(void)save;

@end
