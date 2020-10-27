//
//  Item.swift
//  UltimatePortfolio
//
//  Created by Igor Malyarov on 27.10.2020.
//

import CoreData

extension Item {
    var title: String {
        get { title_ ?? "" }
        set { title_ = newValue }
    }
    var detail: String {
        get { title_ ?? "" }
        set { title_ = newValue }
    }
    var creationDate: Date {
        get { creationDate_ ?? Date() }
        set { creationDate_ = newValue }
    }
    
    static var example: Item {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let item = Item(context: viewContext)
        item.title = "Example Item"
        item.detail = "This is an example item"
        item.priority = 3
        item.creationDate = Date()
        return item
    }

}

extension Item: Comparable {
    public static func < (lhs: Item, rhs: Item) -> Bool {
        if lhs.completed == false {
            if rhs.completed == true {
                return true
            }
        } else if lhs.completed == true {
            if rhs.completed == false {
                return false
            }
        }
        
        if lhs.priority > rhs.priority {
            return true
        } else if lhs.priority < rhs.priority {
            return false
        }
        
        return lhs.creationDate < rhs.creationDate
    }
}
