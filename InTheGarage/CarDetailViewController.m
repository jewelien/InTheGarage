//
//  ViewController.m
//  InTheGarage
//
//  Created by Caleb Hicks on 1/29/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "CarDetailViewController.h"
#import "CarController.h"

@interface CarDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *makeField;
@property (weak, nonatomic) IBOutlet UITextField *modelField;
@property (weak, nonatomic) IBOutlet UITextField *yearField;

@property (nonatomic, weak) Car *car;


@end

@implementation CarDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self updateWithCar:[[CarController sharedInstance].cars lastObject]];
}

- (IBAction)saveButton:(id)sender {
    
    if (self.car) {
        self.car.make = self.makeField.text;
        self.car.model = self.modelField.text;
        self.car.year = self.yearField.text;
        [[CarController sharedInstance] save];
    } else {
        [[CarController sharedInstance] saveCarWithMake:self.makeField.text model:self.modelField.text year:self.yearField.text];
    }
}

- (void)updateWithCar:(Car *)car {
    self.car = car;
    self.makeField.text = car.make;
    self.modelField.text = car.model;
    self.yearField.text = car.year;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
