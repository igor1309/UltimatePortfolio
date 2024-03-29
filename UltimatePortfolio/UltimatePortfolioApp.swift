//
//  UltimatePortfolioApp.swift
//  UltimatePortfolio
//
//  Created by Igor Malyarov on 27.10.2020.
//

import SwiftUI

@main
struct UltimatePortfolioApp: App {
    @StateObject var dataController: DataController
    
    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: save)

        }
    }
    
    func save(_ note: Notification) {
        dataController.save()
    }
}
