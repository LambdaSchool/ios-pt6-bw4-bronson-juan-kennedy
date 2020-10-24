//
//  Mortgage.m
//  Home Mortgage Calculator
//
//  Created by Lambda_School_Loaner_241 on 10/13/20.
//

#import "Mortgage.h"

@implementation Mortgage

- (instancetype)initWithHomePrice:(double)aHomePrice
                      downPayment:(double)aDownPayment
                     interestRate:(double)anInterestRate
                     loanDuration:(double)aLoanDuration
                yearlyPropertyTax:(double)aYearlyPropertyTax {
    self = [super init];
    if (self) {
        _homePrice = aHomePrice;
        _downPayment = aDownPayment;
        _interestRate = anInterestRate;
        _loanDuration = aLoanDuration;
        _yearlyPropertyTax = aYearlyPropertyTax;
    }
    return self;
}

@end
