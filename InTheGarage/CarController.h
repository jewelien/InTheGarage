//
//  CarController.h
//  InTheGarage
//
//  Created by Julien Guanzon on 2/26/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataHelper.h"
#import "Car.h"

@interface CarController : NSObject

@property (nonatomic, strong) NSArray *cars;

+ (CarController *)sharedInstance;

- (Car *)saveCarWithMake:(NSString *)make model:(NSString *)model year:(NSString *)year;

- (void)save;

@end
