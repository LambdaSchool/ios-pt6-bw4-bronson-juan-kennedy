//
//  MortgageCalculatorController.swift
//  Home Mortgage Calculator
//
//  Created by Lambda_School_Loaner_241 on 10/13/20.
//

import Foundation

class MortgageCalculatorController {
    
    static func calculatePayment(homePrice: Double?, downPayment: Double?, interestRate: Double?, loanDuration: Int?, yearlyPropertyTax: Double?) -> Double {
        
        let homePriceAfterDownPayment = (homePrice ?? 100000.0) - (downPayment ?? 0.0)
        print("Home Price: \(homePriceAfterDownPayment)")
        let priceWithInterestRate = (homePriceAfterDownPayment * (interestRate ?? 0.0)) + homePriceAfterDownPayment
        let yearlyPayment = priceWithInterestRate / Double(loanDuration ?? 30)
        let totalMonthlyPayment = (yearlyPayment + (yearlyPropertyTax ?? 0.0)) / 12
        
        print("The payment is: \(totalMonthlyPayment)")
        
        
        return totalMonthlyPayment
    }
    
}
