//
//  ViewController.m
//  Temperatura App
//
//  Created by Alvaro Alva on 9/16/20.
//  Copyright © 2020 Alvaro Alva. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *celciusLabel;
@property (weak, nonatomic) IBOutlet UILabel *fahrenheitLabel;
@property (weak, nonatomic) IBOutlet UISlider *degreeSlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setValues];
}

- (IBAction)degreeSliderAdjust:(id)sender {
    [self setValues];
}
-(float) calculateCelcius {
    float result;
    result = (self.degreeSlider.value -32) * 5.0/9.0;
    
    return result;
}
-(void) setValues {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    [formatter setMaximumFractionDigits:1];
    [formatter setRoundingMode:NSNumberFormatterRoundDown];
    NSString * fahrenheitValue = [formatter stringFromNumber:[NSNumber numberWithFloat:self.degreeSlider.value]];
    // set label value for celcius
    
    // set lavel value for fahrenheit
    NSString * celciusValue = [formatter stringFromNumber:[NSNumber numberWithFloat:self.calculateCelcius]];
    [self.celciusLabel setText:celciusValue];
    [self.fahrenheitLabel setText:fahrenheitValue];
}
@end
