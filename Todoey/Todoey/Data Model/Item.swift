//
//  Item.swift
//  Todoey
//
//  Created by Chinmay Ghotkar on 4/2/18.
//  Copyright © 2018 Chinmay Ghotkar. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    @objc dynamic var dateCreated : Date?
}
