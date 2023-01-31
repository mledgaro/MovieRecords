//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("mr-theme") private var colorTheme: ColorTheme = .dark

    @Environment(\.scenePhase) private var scenePhase
    
    @StateObject private var topMoviesVM = TopMoviesVM()
    @StateObject private var userDataVM = MoviesUserDataVM()
    @StateObject private var movieDetailsVM = MovieDetailsVM()
    
    
    var body: some View {
        
        TabView {
            
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
                
        } // TabView
//        .toolbarBackground(colorTheme.background, for: .tabBar)
        .toolbar(.visible, for: .tabBar)
        .accentColor(colorTheme.highlight)
        
        .environmentObject(self.topMoviesVM)
        .environmentObject(self.userDataVM)
        .environmentObject(self.movieDetailsVM)
        .onChange(of: scenePhase) { phase in
            
            if phase == .inactive {
                
                userDataVM.saveData()
                print("USER DATA SAVED")
            }
        }
        .onAppear {
            
            UITabBar.appearance().barTintColor = UIColor(colorTheme.background)
            UITabBar.appearance().unselectedItemTintColor = UIColor(colorTheme.text)
        }
        .id(colorTheme)
        
    } // var body: some View
    
} // struct ContentView: View


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
