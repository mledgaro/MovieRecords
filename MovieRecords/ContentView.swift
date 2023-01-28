//

import SwiftUI

struct ContentView: View {
    
    @StateObject var topMoviesVM = TopMoviesVM()
    
    @Environment(\.scenePhase) private var scenePhase
    
    @AppStorage("mr-theme") private var theme: String = "dark"
    
    var body: some View {
        
        TabView {
            Group {
                
                MoviesList(title: "Top 250", filter: .all)
                    .tabItem {
                        Label("Top 250", systemImage: "square.3.layers.3d")
                    }
                    
                MoviesList(title: "Favorites", filter: .favorites)
                    .tabItem {
                        Label("Favorites", systemImage: "heart.fill")
                    }
                
                MoviesList(title: "Watched", filter: .watched)
                    .tabItem {
                        Label("Watched", systemImage: "eye")
                    }
                
                Settings()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                
            } // Group
            .toolbar(.visible, for: .tabBar)
//            .toolbarBackground(Color("dark-highlight"), for: /*@START_MENU_TOKEN@*/.tabBar/*@END_MENU_TOKEN@*/)
            
        }
        .environmentObject(topMoviesVM)
        .onChange(of: scenePhase) { phase in
            if phase == .inactive {
                FileManagerVM.MoviesUserDataFM.saveData(topMoviesVM.movies)
                print("USER DATA SAVED")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
