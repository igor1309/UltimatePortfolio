//
//  Project.swift
//  UltimatePortfolio
//
//  Created by Igor Malyarov on 27.10.2020.
//

import CoreData

extension Project {
    var title: String {
        get { title_ ?? "" }
        set { title_ = newValue }
    }
    var detail: String {
        get { detail_ ?? "" }
        set { detail_ = newValue }
    }
    var color: String {
        get { color_ ?? "Light Blue" }
        set { color_ = newValue }
    }
    var items: [Item] {
        get { (items_ as? Set<Item> ?? []).sorted() }
        set { items_ = Set(newValue) as NSSet }
    }
    
    static var example: Project {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let project = Project(context: viewContext)
        project.title = "Example Project"
        project.detail = "This is an example project"
        project.closed = true
        project.creationDate = Date()
        return project
    }

    var completionAmount: Double {
        guard items.isEmpty == false else { return 0 }
        
        let completedItems = items.filter(\.completed)
        return Double(completedItems.count) / Double(items.count)
    }

}
