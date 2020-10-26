//
//  Mortgage.h
//  Home Mortgage Calculator
//
//  Created by Lambda_School_Loaner_241 on 10/13/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(Mortgage)
@interface Mortgage : NSObject

@property (nonatomic) double homePrice;
@property (nonatomic) double downPayment;
@property (nonatomic) double interestRate;
@property (nonatomic) double loanDuration;
@property (nonatomic) double yearlyPropertyTax;
@property (nonatomic) NSString *nickname;

- (instancetype)initWithHomePrice:(double)aHomePrice
                              downPayment:(double)aDownPayment
                             interestRate:(double)anInterestRate
                             loanDuration:(double)aLoanDuration
                        yearlyPropertyTax:(double)aYearlyPropertyTax
                                 nickname:(NSString *)aNickname;

- (NSDictionary *)toDictionary;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
    

@end

NS_ASSUME_NONNULL_END
