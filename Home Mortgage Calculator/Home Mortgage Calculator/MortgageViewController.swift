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
    

}
