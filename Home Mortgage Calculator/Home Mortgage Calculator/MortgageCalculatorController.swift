//
//  MortgageCalculatorController.swift
//  Home Mortgage Calculator
//
//  Created by Lambda_School_Loaner_241 on 10/13/20.
//

import Foundation

class MortgageCalculatorController {
    
    static func calculatePayment(homePrice: Double, downPayment: Double, interestRate: Double, loanDuration: Int, yearlyPropertyTax: Double) -> Double {
        
        let homePriceAfterDownPayment = homePrice - downPayment
        let priceWithInterestRate = (homePriceAfterDownPayment * interestRate) + homePriceAfterDownPayment
        let yearlyPayment = priceWithInterestRate / Double(loanDuration)
        let totalMonthlyPayment = (yearlyPayment + yearlyPropertyTax) / 12
        
        print("The payment is: \(totalMonthlyPayment)")
        
        
        return totalMonthlyPayment
    }
    
}
