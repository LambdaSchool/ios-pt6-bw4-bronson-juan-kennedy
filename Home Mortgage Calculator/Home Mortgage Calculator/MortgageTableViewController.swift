//
//  MortgageTableViewController.swift
//  Home Mortgage Calculator
//
//  Created by Lambda_School_Loaner_241 on 10/20/20.
//

import UIKit

class MortgageTableViewController: UITableViewController {
    
    
    var mortgageCalculatorController: MortgageCalculatorController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InfoSegue" {
            if let addMortgageVC = segue.destination as? MortgageViewController {
                addMortgageVC.delegate = self
            }
        } else if segue.identifier == "cellSegue" {
            if let indexPath = tableView.indexPathForSelectedRow, let mortgageDetailVC = segue.destination as? MortgageDetailViewController {
                mortgageDetailVC.mortgage = mortgageCalculatorController.mortgages[indexPath.row]
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (mortgageCalculatorController?.mortgages.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mortgageCell", for: indexPath)
        
        let mortgage = mortgageCalculatorController!.mortgages[indexPath.row]
        cell.textLabel?.text = mortgage.nickname
        cell.detailTextLabel?.text = String(mortgage.homePrice)

        return cell
    }
    

}

extension MortgageTableViewController: AddMortgageDelegate {
    func mortgageWasAdded(_ mortgage: Mortgage) {
        mortgageCalculatorController.mortgages.append(mortgage)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
        
    }
    
    
}


