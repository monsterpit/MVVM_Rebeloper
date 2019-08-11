//
//  User.swift
//  MVVM_Rebeloper
//
//  Created by MB on 8/11/19.
//  Copyright © 2019 MB. All rights reserved.
//

// Basic model of User

import UIKit


struct User{
    
    let name : String
    let age : Int
    let backgroundColor : UIColor
    
    init(name : String,age : Int , backgroundColor : UIColor ) {
        self.name = name
        self.age = age
        self.backgroundColor = backgroundColor
    }
    

    
}
