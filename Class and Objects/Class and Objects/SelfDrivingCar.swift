//
//  SelfDrivingCar.swift
//  Class and Objects
//
//  Created by Chinmay Ghotkar on 3/13/18.
//  Copyright © 2018 Chinmay Ghotkar. All rights reserved.
//

import Foundation

class SelfDrivingCar : Car {
    
    var destination : String?
    
    override func drive() {
        super.drive()
        
        if let userSetDestination = destination {
            print("Driving to \(userSetDestination)!")
        }
    }
    
}
