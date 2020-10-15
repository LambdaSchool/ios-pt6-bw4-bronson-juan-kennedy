//
//  MortgageViewController.swift
//  Home Mortgage Calculator
//
//  Created by Lambda_School_Loaner_241 on 10/13/20.
//

import UIKit

class MortgageViewController: UIViewController {
    @IBOutlet weak var estPaymentLabel: UILabel!
    
    @IBOutlet weak var detailsButton: UIButton!
    
    @IBOutlet weak var homePriceTextField: UITextField!
    
    @IBOutlet weak var durationTextField: UITextField!
    
    @IBOutlet weak var downPaymentSlider: UISlider!
    
    @IBOutlet weak var intRateSlider: UISlider!
    
    @IBOutlet weak var propertyTaxSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func detailButtonTapped(_ sender: Any) {
    }
    
    @IBAction func downPaymentSlide(_ sender: Any) {
    }
    
    @IBAction func IntRateSlide(_ sender: Any) {
    }
    
    @IBAction func propertyTaxSlide(_ sender: Any) {
    }
    
    // continue tmrw
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
