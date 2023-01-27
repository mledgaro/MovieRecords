//

import SwiftUI

struct ContentView: View {
    
    @StateObject var topMoviesVM = TopMoviesVM()
    
    @Environment(\.scenePhase) private var scenePhase
    
    
    var body: some View {
        
        TabView {
            
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
            
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive {
                FileManagerVM.MoviesUserDataFM.saveData(topMoviesVM.movies)
                print("USER DATA SAVED")
            }
        }
        .environmentObject(topMoviesVM)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
