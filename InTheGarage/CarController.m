//
//  CarController.m
//  InTheGarage
//
//  Created by Julien Guanzon on 2/26/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "CarController.h"
#import <CloudKit/CloudKit.h>

@implementation CarController

+ (CarController *)sharedInstance {
    static CarController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CarController new];
    });
    return sharedInstance;
}

+ (CKDatabase *)privateDB {
    CKDatabase *database = [[CKContainer defaultContainer] privateCloudDatabase];
    return database;
}

- (NSArray *)cars {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Car"];
    
    return [[CoreDataHelper sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];
}

- (void)save {
    [[CoreDataHelper sharedInstance] save];
}

- (void)saveCarWithMake:(NSString *)make model:(NSString *)model year:(NSString *)year {
    CKRecord *cloudKitCar = [[CKRecord alloc] initWithRecordType:CarRecordKey];
    cloudKitCar[CarIdentifierKey] = [[NSUUID UUID] UUIDString];
    cloudKitCar[CarMakeKey] = make;
    cloudKitCar[CarModelKey] = model;
    cloudKitCar[CarYearKey] = year;
    
    [[CarController privateDB] saveRecord:cloudKitCar completionHandler:^(CKRecord *record, NSError *error) {
        if (!error) {
            NSLog(@"Saved Car to CloudKit");
            [self storeRecordToCoreData:cloudKitCar uploaded:YES];
        } else {
            NSLog(@"NOT saved Car to CloudKit");
            [self storeRecordToCoreData:cloudKitCar uploaded:NO];
        }
    }];
}

//- (Car *)saveCarWithMake:(NSString *)make model:(NSString *)model year:(NSString *)year {
//    Car *car = [NSEntityDescription insertNewObjectForEntityForName:@"Car" inManagedObjectContext:[CoreDataHelper sharedInstance].managedObjectContext];
//    car.make = make;
//    car.model = model;
//    car.year = year;
//    
//    [self save];
//    return car;
//}

- (void)storeRecordToCoreData:(CKRecord *)record uploaded:(BOOL)uploaded {
    Car *coreDataCar = [NSEntityDescription insertNewObjectForEntityForName:@"Car" inManagedObjectContext:[CoreDataHelper sharedInstance].managedObjectContext];
    coreDataCar.identifier = record[CarIdentifierKey];
    coreDataCar.make = record[CarMakeKey];
    coreDataCar.model = record[CarModelKey];
    coreDataCar.year = record[CarModelKey];
    coreDataCar.uploaded = [NSNumber numberWithBool:uploaded];
    
    [self save];
}

- (void)removeCar:(Car *)car {
    CKRecordID *carRecordId = [[CKRecordID alloc] initWithRecordName:car.identifier];
    [[CarController privateDB] deleteRecordWithID:carRecordId completionHandler:^(CKRecordID *recordID, NSError *error) {
        if (!error) {
            NSLog(@"Deleted Car from CloudKit");
        } else {
            NSLog(@"Did NOT delete Car from CloudKit");
        }
    }];

    [car.managedObjectContext deleteObject:car];
    [self save];
}



@end
