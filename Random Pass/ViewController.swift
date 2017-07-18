//
//  ViewController.swift
//  Random Pass
//
//  Created by Ananya Sehgal on 6/28/17.
//  Copyright © 2017 De Dawg. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstNamePet: UITextField!
    @IBOutlet weak var momsName: UITextField!
    @IBOutlet weak var dadsName: UITextField!
    @IBOutlet weak var favoriteColor: UITextField!
    var accounts: [UserAccounts] = []
    var password : Pass = Pass()
    let prefs:UserDefaults = UserDefaults.standard
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        print(prefs.value(forKey: "myKey") as? [UserAccounts])
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    
    {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        print(accounts.count)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        
    {
        password.first = firstName.text!
        password.second = lastName.text!
        password.third = firstNamePet.text!
        password.fourth = momsName.text!
        password.fifth = dadsName.text!
        password.sixth = favoriteColor.text!
        
        let nextView = segue.destination as! DetailViewController
        
        nextView.myPassed = password
        
        prefs.value(forKey: "myKey") as? Array<UserAccounts>
        
        
        }
  
    @IBAction func unwindToThisView(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? DetailViewController
        {
            
        }
    }
}
    



