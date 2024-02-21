//
//  EmployeeDetailTableViewController.swift
//  EmployeeRoster
//
//  Created by Thilagawathy Duraisamy on 13/2/2024.
//

import UIKit

protocol EmployeeDetailTableViewControllerDelegate: AnyObject {
    func employeeDetailTableViewController(_ controller: EmployeeDetailTableViewController, didSave employee: Employee)
}

class EmployeeDetailTableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var employeeType: UILabel!
    @IBOutlet weak var saveBarButtonItem: UIBarButtonItem!
    
    var employee: Employee?
    weak var delegate: EmployeeDetailTableViewControllerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveBarButtonItem.isEnabled = false
        
        if employee != nil {
            nameTextField.text = employee?.name
            dateOfBirthTextField.text = employee?.dateOfBirth.description
            navigationItem.title = "Edit employee"
        }
        else {
            navigationItem.title = "New employee"
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    // MARK: - Table view data source
    
    @IBAction func nameTextFieldDidChanged(_ sender: UITextField)
    {
        updateSaveButtonState()
    }
    
    @IBAction func saveButton()
    {
        guard let name = nameTextField.text else {
            print(#function,"employee name empty")
            return
        }
        
        let employee = Employee(name: name,dateOfBirth: Date(), employeeType: "full")
        print(#function,"employee detail \(employee)")
        delegate?.employeeDetailTableViewController(self, didSave: employee)
    }
    
    func updateSaveButtonState() {
        let shouldEnableSaveButton = nameTextField.text?.isEmpty == false
        
        saveBarButtonItem.isEnabled = shouldEnableSaveButton
       
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
