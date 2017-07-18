//
//  UserAccounts.swift
//  Random Pass
//
//  Created by Ananya Sehgal on 7/6/17.
//  Copyright © 2017 De Dawg. All rights reserved.
//

import UIKit

class UserAccounts:  NSObject
{
    var url = ""
    var website = ""
    let prefs = UserDefaults.standard
    

    
    init(Website: String, Url: String)
    {
        
        url = Url
        website = Website
        
        prefs.setValue(Url, forKey: "url")
        prefs.setValue(Website, forKey: "website")
       
    }
    
}


