//
//  MortgageCalculatorController.swift
//  Home Mortgage Calculator
//
//  Created by Lambda_School_Loaner_241 on 10/13/20.
//

import Foundation

class MortgageCalculatorController {
    
    // Persistent File URL
    private var persistentFileURL: URL? {
      let fileManager = FileManager.default
      guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        else { return nil }
      
        
      return documents.appendingPathComponent("mortgage.json")
    }
    
    var mortgages: [Mortgage] = []
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let dictionary = mortgages.map {$0.toDictionary()}
            
            let data = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
            try data.write(to: url)
        } catch {
            print("Error saving data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [[AnyHashable : Any]]
        
            for dictionary in json {
                let mortgage = Mortgage(dictionary: dictionary)
                mortgages.append(mortgage)
            }
            
        } catch {
            print("error loading mortgages data: \(error)")
        }
    }
    
    func calculatePayment(forMortgage mortgage: Mortgage) -> Double {
        
        let homePriceAfterDownPayment = (mortgage.homePrice ) - (mortgage.downPayment )
        let priceWithInterestRate = (homePriceAfterDownPayment * (mortgage.interestRate )) + homePriceAfterDownPayment
        let yearlyPayment = priceWithInterestRate / Double(mortgage.loanDuration )
        let totalMonthlyPayment = (yearlyPayment + (mortgage.yearlyPropertyTax )) / 12
        
        print("The payment is: \(totalMonthlyPayment)")
        
        return totalMonthlyPayment
    }
    
}
