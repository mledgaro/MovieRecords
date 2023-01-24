//

import SwiftUI

struct ContentView: View {
    
    @StateObject var imdbApi = IMDbAPI()
    
    
    var body: some View {
        
        TabView {
            
            MoviesList(title: "Top 250", movies: imdbApi.movies)
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
