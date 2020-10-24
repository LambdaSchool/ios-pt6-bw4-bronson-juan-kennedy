//
//  MortgageDetailViewController.swift
//  Home Mortgage Calculator
//
//  Created by Lambda_School_Loaner_241 on 10/22/20.
//

import UIKit

class MortgageDetailViewController: UIViewController {
    @IBOutlet weak var homePriceLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var downPaymentLabel: UILabel!
    
    @IBOutlet weak var interestRateLabel: UILabel!
    
    @IBOutlet weak var propertyTaxLabel: UILabel!
    
    @IBOutlet weak var monthlyPaymentLabel: UILabel!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    var mortgage: Mortgage?
    var myValue: Double?
    
    
    var mortgageVC: MortgageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        print(myValue)
        print(mortgage)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
    private func updateViews(){
        guard let mortgage = mortgage else { return }
        guard let mortgageVC = mortgageVC else { return }
        
        homePriceLabel.text = mortgageVC.homePriceTextField.text
        durationLabel.text = String(mortgage.loanDuration)
        downPaymentLabel.text = String(mortgage.downPayment)
        interestRateLabel.text = String(mortgage.interestRate)
        propertyTaxLabel.text = String(mortgage.yearlyPropertyTax)
        monthlyPaymentLabel.text = mortgageVC.monthlyPaymentLabel.text
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
