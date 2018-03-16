//
//  ViewController.h
//  IOSObjectiveC_Calculator
//
//  Created by Gehad Ahmed on 3/14/18.
//  Copyright © 2018 Gehad Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property float firstNumber;
@property float secondNumber;
@property float result;
@property NSMutableString * input;

- (IBAction)operationsAction:(id)sender;
- (IBAction)numbersAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *calculatorInput;
-(void) calculateResult;
@end

