//
//  ViewController.m
//  IOSObjectiveC_Calculator
//
//  Created by Gehad Ahmed on 3/14/18.
//  Copyright © 2018 Gehad Ahmed. All rights reserved.
//

#import "ViewController.h"
#import <math.h>
@interface ViewController ()
{
    NSString * operation;
    char tempOp;

    Boolean opFlag;
    Boolean invalidDivision;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    opFlag=false;
    invalidDivision = false;
    operation = [NSString new];
    _input = [NSMutableString new];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)operationsAction:(id)sender {
    
    _calculatorInput.text= [sender currentTitle];
    operation = [sender currentTitle];
    
    switch ([operation characterAtIndex:0]) {
        case '=':
            _secondNumber =[_input floatValue];
            [_input setString:@""];
            [self calculateResult];
            opFlag=false;
          
            break;
        case 'C':
            [_input setString:@""];
            _calculatorInput.text = @"";
            _firstNumber=0;
            _secondNumber=0;
            _result=0;
            break;
            
        default:
            if(_firstNumber==0)
                _firstNumber = [_input floatValue];
            [_input setString:@""];
            tempOp = [operation characterAtIndex:0];
            opFlag = true;
            break;
    }
    
}

- (IBAction)numbersAction:(id)sender {
    
    if(opFlag == true)
        [_input setString:@""];
    [_input appendString:[sender currentTitle]];
    _calculatorInput.text = _input;
}

-(void)calculateResult{
    
    switch (tempOp) {
        case '+':
            _result = _firstNumber + _secondNumber;
            break;
        case '-':
            _result = _firstNumber - _secondNumber;
            break;
        
        case 'X':
            _result = _firstNumber * _secondNumber;
            break;
        
        case '/':
            if(_secondNumber== 0)
                invalidDivision=true;
            
            else
            _result = _firstNumber / _secondNumber;
            break;
        case '%':

            _result = _firstNumber - ((int)(_firstNumber/_secondNumber)*_secondNumber);
            break;
        default:
            break;
    }
    if(invalidDivision == true){
        _calculatorInput.text = @"Not a number";
        invalidDivision = false;
    }
    else
        _calculatorInput.text = [NSString stringWithFormat:@"%f", _result];
    
    _firstNumber = _result;
    _secondNumber=0;
}
@end
