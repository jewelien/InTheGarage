//
//  CarDetailViewController.m
//  InTheGarage
//
//  Created by Caleb Hicks on 1/29/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "CarDetailViewController.h"

@interface CarDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *makeTextField;
@property (weak, nonatomic) IBOutlet UITextField *modelTextField;
@property (weak, nonatomic) IBOutlet UITextField *yearTextField;
@property (weak, nonatomic) IBOutlet UITextField *colorTextField;

@property (strong, nonatomic) Car *car;

@end

@implementation CarDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self updateWithCar:self.car];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateWithCar:(Car *)car {
    self.car = car;
    
    self.makeTextField.text = car.make;
    self.modelTextField.text = car.model;
    self.yearTextField.text = [NSString stringWithFormat:@"%@", car.year];
    self.colorTextField.text = car.color;
}

- (IBAction)saveCar:(id)sender {
    
    if (!self.car) {
        [[CarController sharedInstance] addCarWithMake:self.makeTextField.text model:self.modelTextField.text year:[self.yearTextField.text integerValue] andColor:self.colorTextField.text];
    } else {
        self.car.make = self.makeTextField.text;
        self.car.model = self.modelTextField.text;
        self.car.year = [NSNumber numberWithLong:[self.yearTextField.text longLongValue]];
        [[CarController sharedInstance] save];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
