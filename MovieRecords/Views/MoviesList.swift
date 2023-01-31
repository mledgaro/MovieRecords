//

import SwiftUI

struct MoviesList: View {
    
    @AppStorage("mr-theme") private var colorTheme: AppTheme = .dark
    
    @EnvironmentObject var topMoviesVM: TopMoviesVM
    @EnvironmentObject var userDataVM: MoviesUserDataVM
    
    var title: String
    var filter: MoviesFilter
    
    
    var body: some View {
        
        VStack {
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(colorTheme.highlight)
                .multilineTextAlignment(.center)
            
            NavigationView {
                
                List(topMoviesVM.movies, id: \.id) { movie in
                    
                    if userDataVM.isShowing(imdbId: movie.id, filter: filter) {
                        
                        MovieListItem(index: movie.index)
                            .listRowBackground(colorTheme.background)
                    }
                }
                .scrollContentBackground(.hidden)
                .background(colorTheme.background)
            }
            
        }
        .background(colorTheme.background)
    }
}

struct MoviesList_Previews: PreviewProvider {
    
    static var previews: some View {
        MoviesList(title: "Top 250", filter: .all)
            .environmentObject(TopMoviesVM())
            .environmentObject(MoviesUserDataVM())
    }
}
