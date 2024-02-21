//
//  EmployeeListTableViewController.swift
//  EmployeeRoster
//
//  Created by Thilagawathy Duraisamy on 13/2/2024.
//

import UIKit

class EmployeeListTableViewController: UITableViewController, EmployeeDetailTableViewControllerDelegate {

    

    var emplyoeeList: [Employee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emplyoeeList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeDetailCell", for: indexPath)

        // Configure the cell...
        let employee = emplyoeeList[indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        config.text = employee.name
        config.secondaryText = employee.employeeType
        cell.contentConfiguration = config
        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - segue
    @IBAction func unwindToEmployeeList(segue: UIStoryboardSegue)
    {
        
    }
    
    @IBSegueAction func addEditEmployeeDetailController(_ coder: NSCoder, sender: Any?) -> EmployeeDetailTableViewController? {
     
        let detailEmployeeController = EmployeeDetailTableViewController(coder: coder)
        detailEmployeeController?.delegate = self
        
        guard  let cell = sender as? UITableViewCell, let index = tableView.indexPath(for: cell) else{
            print(#function,"new employee")
            return detailEmployeeController
        }
        
        let employee = emplyoeeList[index.row]
        detailEmployeeController?.employee = employee
        
        return detailEmployeeController
    }
    
    
    func employeeDetailTableViewController(_ controller: EmployeeDetailTableViewController, didSave employee: Employee) {
      
        if let indexRow = tableView.indexPathForSelectedRow {
            emplyoeeList.remove(at: indexRow.row)
            emplyoeeList.insert(employee, at: indexRow.row)
        } else {
            print(#function, "Append employee")
            emplyoeeList.append( employee )
            
        }
        print(#function,"reload data")
        tableView.reloadData()
        dismiss(animated: true)
        
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
