//
//  DetailViewController.swift
//  Random Pass
//
//  Created by Ananya Sehgal on 6/28/17.
//  Copyright © 2017 De Dawg. All rights reserved.
//

import UIKit
var userAccounts: [UserAccounts] = []

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var myTableView: UITableView!
    var myPassed : Pass?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print(myPassed!.first)
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        
        myTableView.reloadData()
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return userAccounts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel!.text = userAccounts[indexPath.row].website
        cell.detailTextLabel!.text = userAccounts[indexPath.row].url
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
           userAccounts.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let movedAccount = userAccounts[sourceIndexPath.row]
        userAccounts.remove(at: sourceIndexPath.row)
        userAccounts.insert(movedAccount, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem)
    {
        let addAlert = UIAlertController(title: "Enter Web Info", message: nil, preferredStyle: .alert)
        addAlert.addTextField
            { (nameTextField) in
            nameTextField.placeholder = "Enter Name of Website Here"
            }
        addAlert.addTextField
            { (nameTextField) in
            nameTextField.placeholder = "Enter Web URl Here"
            }
        let addButtonAction = UIAlertAction  (title: "add", style: .default)
        { (addAction) -> Void in
            userAccounts.append(UserAccounts(Website: (addAlert.textFields?[0].text!)!, Url: (addAlert.textFields?[1].text!)!))
            
            self.myTableView.reloadData()
        }
        
        addAlert.addAction(addButtonAction)
        addAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(addAlert, animated: true, completion: nil)
        
    
        
    }

    @IBAction func editButtonTapped(_ sender: UIBarButtonItem)
    {
        myTableView.isEditing = !myTableView.isEditing
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        
    {
        let passwordController = segue.destination as! PasswordViewController
        
        passwordController.selectedUserAccount = userAccounts[(myTableView.indexPathForSelectedRow?.row)!]
        
        passwordController.myPassedAgain = myPassed
    }
}
