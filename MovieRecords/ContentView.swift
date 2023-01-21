//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            
            MoviesList(title: "Top 250")
                .tabItem {
                    Label("Top 250", systemImage: "square.3.layers.3d")
                }
            
            MoviesList(title: "Favorites")
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
