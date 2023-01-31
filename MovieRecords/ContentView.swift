//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("mr-theme") private var colorTheme: AppTheme = .dark

    @Environment(\.scenePhase) private var scenePhase
    
    @StateObject var topMoviesVM = TopMoviesVM()
    @StateObject var userDataVM = MoviesUserDataVM()
    
    
    var body: some View {
        
        TabView {
            Group {
                
                MoviesList(title: "Top 250", filter: .all)
                    .tabItem {
                        Label("Top 250", systemImage: "square.3.layers.3d")
                    }
                    
                MoviesList(title: "Watched", filter: .watched)
                    .tabItem {
                        Label("Watched", systemImage: "eye")
                    }
                
                MoviesList(title: "Pending", filter: .pending)
                    .tabItem {
                        Label("Pending", systemImage: "eye.slash")
                    }
                
                MoviesList(title: "Favorites", filter: .favorites)
                    .tabItem {
                        Label("Favorites", systemImage: "heart.fill")
                    }
                
                Settings()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                
            } // Group
//            .toolbar(.visible, for: .tabBar)
//            .toolbarBackground(Color("dark-highlight"), for: /*@START_MENU_TOKEN@*/.tabBar/*@END_MENU_TOKEN@*/)
            
        } // TabView
        .environmentObject(topMoviesVM)
        .environmentObject(userDataVM)
        .onChange(of: scenePhase) { phase in
            if phase == .inactive {
                userDataVM.saveData()
                print("USER DATA SAVED")
            }
        }
        
    } // var body: some View
    
} // struct ContentView: View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
