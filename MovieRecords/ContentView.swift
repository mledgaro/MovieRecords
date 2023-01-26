//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var topMoviesVM = TopMoviesVM()
    
    
    var body: some View {
        
        TabView {
            
            MoviesList(title: "Top 250", movies: topMoviesVM.movies)
                .tabItem {
                    Label("Top 250", systemImage: "square.3.layers.3d")
                }
            
            Text("Favorites")
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
            
            Text("Watched")
                .tabItem {
                    Label("Watched", systemImage: "eye")
                }
            
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            
        }
        .onDisappear {
            print("DISAPPEAR EVENT")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
