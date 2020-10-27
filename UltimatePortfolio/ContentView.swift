//
//  ContentView.swift
//  UltimatePortfolio
//
//  Created by Igor Malyarov on 27.10.2020.
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("selectedTab") var selectedTab: Tab = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag(Tab.home)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            ProjectsView(showClosedProjects: false)
                .tag(Tab.open)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Open")
                }
            
            ProjectsView(showClosedProjects: true)
                .tag(Tab.close)
                .tabItem {
                    Image(systemName: "checkmark")
                    Text("Closed")
                }
        }
    }
    
    /// looks like much better solution than original paul hudson's
    /// https://www.hackingwithswift.com/plus/ultimate-portfolio-app/storing-tab-selection
    /// https://lostmoa.com/blog/UsingSceneStorageForStateRestorationInSwiftUIApps/
    enum Tab: String {
        case home
        case open
        case close
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
