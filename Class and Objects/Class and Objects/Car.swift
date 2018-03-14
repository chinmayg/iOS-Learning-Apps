//
//  Car.swift
//  Class and Objects
//
//  Created by Chinmay Ghotkar on 3/13/18.
//  Copyright © 2018 Chinmay Ghotkar. All rights reserved.
//

import Foundation

enum CarType {
    case Sedan
    case Coupe
    case HatchBack
}

class Car {
    var color = "Black"
    var numOfSeats = 5
    var carType : CarType = .Coupe
    
    // designated init
    init() {
        
    }
    
    //convienance init
    convenience init(customerChosenColor : String) {
        self.init()
        color = customerChosenColor
    }
    
    func drive() {
        print("Car is moving.")
    }
}
