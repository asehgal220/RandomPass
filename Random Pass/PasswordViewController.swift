//
//  PasswordViewController.swift
//  Random Pass
//
//  Created by Ananya Sehgal on 6/28/17.
//  Copyright © 2017 De Dawg. All rights reserved.
//

import UIKit
import SafariServices

class PasswordViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
    {

    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var webAdressTextField: UILabel!
    let prefs = UserDefaults.standard
    var selectedUserAccount: UserAccounts?
    var myPassedAgain : Pass?

    override func viewDidLoad()
    {
    super.viewDidLoad()
    
        myLabel1.text = myPassedAgain!.password
        webAdressTextField.text = selectedUserAccount?.url

        
        if myPassedAgain!.password == ""
        {
        
        var passingStuff  = [myPassedAgain!.first, myPassedAgain!.second, myPassedAgain!.third, myPassedAgain!.fourth, myPassedAgain!.fifth, myPassedAgain?.sixth]
            
            var specialCharacters = ["!", "@", "#", "$", "%", "^", "&", "*"]
            var numbers = ["1", "2", "3", "4", "5", "^", "6", "7", "8", "9", "0"]
        
        let randomIndex = Int(arc4random() % UInt32(passingStuff.count))
        let randomIndex2 = Int(arc4random() % UInt32(passingStuff.count))
        let randomIndex3 = Int(arc4random() % UInt32(passingStuff.count))
        let randomIndex4 = Int(arc4random() % UInt32(specialCharacters.count))
        let randomIndex5 = Int(arc4random() % UInt32(numbers.count))
    
            myPassedAgain!.password = passingStuff[randomIndex]! + passingStuff[randomIndex2]! + passingStuff[randomIndex3]! + specialCharacters[randomIndex4] + numbers[randomIndex5]
            
            myLabel1.text = myPassedAgain!.password
            prefs.setValue(myPassedAgain?.password, forKey: "name")
            prefs.setValue(selectedUserAccount?.url, forKey: "webAdress")

        }
        
        
}
    

    @IBAction func safari(_ sender: Any)
    {
        
        
    let customURL =  URL(string: selectedUserAccount!.url)
    UIApplication.shared.open(customURL! )
    
    
    }
    
    @IBAction func copyToClipboard(_ sender: Any)
    
    {
        UIPasteboard.general.string = myLabel1.text
    }
    
    
 


}

