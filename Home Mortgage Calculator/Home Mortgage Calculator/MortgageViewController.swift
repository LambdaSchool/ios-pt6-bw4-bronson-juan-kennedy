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
    
    @IBOutlet weak var interestRateSlider: UISlider!

    @IBOutlet weak var downPaymentLabel: UILabel!
    
    @IBOutlet weak var interestRateLabel: UILabel!
    
    @IBOutlet weak var propertyTaxesYearLabel: UILabel!

    @IBOutlet weak var enteredDownPaymentTextField: UITextField!
    
    @IBOutlet weak var enteredPropertyTaxYearlyTextField: UITextField!
    
    // MARK: - IBActions
    
    @IBAction func detailsButtonTapped(_ sender: Any) {
    }
    
    @IBAction func downPaymentSliderValueChanged(_ sender: UISlider) {
        let currentValue = Double(sender.value)
        
        switch sender.tag {
        case 0: let value = String(format: "%.2f", currentValue)
            interestRateLabel.text = "Interest Rate: \(value)%"
        
        default:
            break
        }
        calculateMonthlyPayment()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @IBAction func homePriceTextFieldChanged(_ sender: Any) {
        calculateMonthlyPayment()
        self.view.endEditing(true)
    }
    
    @IBAction func loanDurationFieldChanged(_ sender: Any) {
        self.view.endEditing(true)
        calculateMonthlyPayment()
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

    
    func calculateMonthlyPayment() {
        let monthlyPayment = MortgageCalculatorController.calculatePayment(homePrice: Double(homePriceTextField.text!), downPayment: Double(enteredDownPaymentTextField.text!), interestRate: Double(interestRateSlider.value), loanDuration: Int(durationTextField.text!), yearlyPropertyTax: Double(enteredPropertyTaxYearlyTextField.text!))
        
        monthlyPaymentLabel.text = String(format: "%.2f", monthlyPayment)
    }
}
