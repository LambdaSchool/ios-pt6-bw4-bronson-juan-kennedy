//
//  MortgageViewController.swift
//  Home Mortgage Calculator
//
//  Created by Lambda_School_Loaner_241 on 10/13/20.
//

import UIKit
import EventKit

class MortgageViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var monthlyPaymentLabel: UILabel!
    
    @IBOutlet weak var detailsButton: UIButton!
    
    @IBOutlet weak var homePriceTextField: UITextField!
    
    @IBOutlet weak var durationTextField: UITextField!
    
    @IBOutlet weak var downPaymentSlider: UISlider!
    
    @IBOutlet weak var interestRateSlider: UISlider!
    
    @IBOutlet weak var propertyTaxSlider: UISlider!

    // MARK: - IBActions
    
    @IBAction func detailsButtonTapped(_ sender: Any) {
    }
    
    @IBAction func downPaymentSliderValueChanged(_ sender: Any) {
    }
    
    @IBAction func interestRateSliderValueChanged(_ sender: Any) {
    }
    
    @IBAction func propertyTaxSliderValueChanged(_ sender: Any) {
    }
    
    @IBAction func remindMeButtonTapped(_ sender: UIButton) {
        // Do EventKit logic here
    }
    

}
