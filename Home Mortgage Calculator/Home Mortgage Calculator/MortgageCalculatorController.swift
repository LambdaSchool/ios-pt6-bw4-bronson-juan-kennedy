//
//  MortgageCalculatorController.swift
//  Home Mortgage Calculator
//
//  Created by Lambda_School_Loaner_241 on 10/13/20.
//

import Foundation

class MortgageCalculatorController {
    
    static func calculatePayment(forMortgage mortgage: Mortgage) -> Double {
        
        let homePriceAfterDownPayment = (mortgage.homePrice ) - (mortgage.downPayment )
        let priceWithInterestRate = (homePriceAfterDownPayment * (mortgage.interestRate )) + homePriceAfterDownPayment
        let yearlyPayment = priceWithInterestRate / Double(mortgage.loanDuration )
        let totalMonthlyPayment = (yearlyPayment + (mortgage.yearlyPropertyTax )) / 12
        
        print("The payment is: \(totalMonthlyPayment)")
        
        return totalMonthlyPayment
    }
    
}
/*
 homePrice: Double?, downPayment: Double?, interestRate: Double?, loanDuration: Int?, yearlyPropertyTax: Double?
 */
