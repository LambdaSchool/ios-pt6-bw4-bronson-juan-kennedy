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
                yearlyPropertyTax:(double)aYearlyPropertyTax
                         nickname:(NSString *)aNickname
{
    self = [super init];
    if (self) {
        _homePrice = aHomePrice;
        _downPayment = aDownPayment;
        _interestRate = anInterestRate;
        _loanDuration = aLoanDuration;
        _yearlyPropertyTax = aYearlyPropertyTax;
        _nickname = aNickname;
    }
    return self;
}

- (NSDictionary *)toDictionary {
    return @{
        @"price": [NSNumber numberWithDouble:self.homePrice],
        @"downPayment": [NSNumber numberWithDouble:self.downPayment],
        @"interestRate": [NSNumber numberWithDouble:self.interestRate],
        @"loanDuration": [NSNumber numberWithDouble:self.loanDuration],
        @"tax": [NSNumber numberWithDouble:self.yearlyPropertyTax],
        @"name": self.nickname
    };
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSNumber *priceN = dictionary[@"price"];
    double price = [priceN doubleValue];
    NSNumber *downPaymentN = dictionary[@"downPayment"];
    double downPayment = [downPaymentN doubleValue];
    NSNumber *interestRateN = dictionary[@"interestRateN"];
    double interestRate = [interestRateN doubleValue];
    NSNumber *loanDurationN = dictionary[@"loanDurationN"];
    double loanDuration = [loanDurationN doubleValue];
    NSNumber *taxN = dictionary[@"taxN"];
    double tax = [taxN doubleValue];
    NSString *name = dictionary[@"name"];
    
    return [self initWithHomePrice:price downPayment:downPayment interestRate:interestRate loanDuration:loanDuration yearlyPropertyTax:tax nickname:name];
}

@end
