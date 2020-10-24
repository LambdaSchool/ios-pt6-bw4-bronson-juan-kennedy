//
//  MortgageViewController.swift
//  Home Mortgage Calculator
//
//  Created by Lambda_School_Loaner_241 on 10/13/20.
//

import UIKit
import EventKit

protocol AddMortgageDelegate {
    func mortgageWasAdded(_ mortgage: Mortgage)
}

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
    
    @IBOutlet weak var interestRateSlider: UISlider!

    @IBOutlet weak var downPaymentLabel: UILabel!
    
    @IBOutlet weak var interestRateLabel: UILabel!
    
    @IBOutlet weak var propertyTaxesYearLabel: UILabel!

    @IBOutlet weak var enteredDownPaymentTextField: UITextField!
    
    @IBOutlet weak var enteredPropertyTaxYearlyTextField: UITextField!
    
    var delegate: AddMortgageDelegate?
    
    var myValue: Double = 0.0
    
    var mortgage: Mortgage?
    
    // MARK: - IBActions
    
    @IBAction func detailsButtonTapped(_ sender: Any) {
    }
    
    @IBAction func interestRateSliderValueChanged(_ sender: UISlider) {
        let currentValue = Double(sender.value)
        
        switch sender.tag {
        case 0: let value = String(format: "%.2f", currentValue)
            interestRateLabel.text = "Interest Rate: \(value)%"
        
        default:
            break
        }
        calculateMonthlyPayment()
        
    }
    
    @IBAction func userInputTextFieldChanged(_ sender: Any) {
        
        calculateMonthlyPayment()
        self.view.endEditing(true)
    }
    
    @IBAction func remindMeButtonTapped(_ sender: UIButton) {
        let preReminderAlert = UIAlertController(title: "Set a reminder?",
                                                 message: "You will be reminded to pay your mortgage at the beginning of each month.",
                                                 preferredStyle: .alert)
        let confirmReminderAction = UIAlertAction(title: "OK", style: .default) { (action) in
            let eventStore: EKEventStore = EKEventStore()
            
            eventStore.requestAccess(to: .reminder) { (granted, error) in
                if (granted) && (error == nil) {
                    print("Permission to access reminders is granted")
                    
                    let reminder: EKReminder = EKReminder(eventStore: eventStore)
                    reminder.title = "Pay mortgage"
                    // reminder.notes = ""
                    reminder.calendar = eventStore.defaultCalendarForNewReminders()
                    reminder.addRecurrenceRule(EKRecurrenceRule(recurrenceWith: .monthly, interval: 1, end: nil))
                    
                    guard let interval = Calendar.current.dateInterval(of: .month, for: Date()) else { return }
                    let lastOfMonth = interval.end
                    
                    reminder.dueDateComponents = Calendar.current.dateComponents([.year, .month, .day], from: lastOfMonth)
                    
                    do {
                        try eventStore.save(reminder, commit: true)
                    } catch let error as NSError {
                        print("Could not save reminder to event store: \(error)")
                    }
                } else {
                    print("Access was not granted")
                }
                
            }
            
            let alert = UIAlertController(title: "Reminder created", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        preReminderAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        preReminderAlert.addAction(confirmReminderAction)
        
        self.present(preReminderAlert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    
    func calculateMonthlyPayment() {

        let homePrice = Double(homePriceTextField.text ?? "0.0") ?? 0.0
        let downPayment = Double(enteredDownPaymentTextField.text ?? "0.0") ?? 0.0
        let interestRate = Double(interestRateSlider.value)
        let loanDuration = Double(durationTextField.text ?? "0.0") ?? 0.0
        let yearlyTax = Double(enteredPropertyTaxYearlyTextField.text ?? "0.0") ?? 0.0
        
            
        let mortgage = Mortgage(homePrice: homePrice, downPayment: downPayment, interestRate: interestRate, loanDuration: loanDuration, yearlyPropertyTax: yearlyTax)
        
        let monthlyPayment = MortgageCalculatorController.calculatePayment(forMortgage: mortgage)
        
        myValue = monthlyPayment
        self.mortgage = mortgage
        monthlyPaymentLabel.text = String(format: "%.2f", monthlyPayment)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let detailMortgageVC = segue.destination as? MortgageDetailViewController {
                detailMortgageVC.mortgageVC = self
                detailMortgageVC.myValue = myValue
                detailMortgageVC.mortgage = mortgage
            }
        }
    }
}
