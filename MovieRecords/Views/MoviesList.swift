//

import SwiftUI

struct MoviesList: View {
    
    
    @EnvironmentObject var topMoviesVM: TopMoviesVM
    
    @AppStorage("mr-theme") private var colorTheme: AppTheme = .dark
    
    var title: String
    
    private var filterFunc: (MovieBasic) -> Bool
    
    
    init(title: String, filter: MoviesFilter) {
        
        self.title = title
        
        switch filter {
            
            case .all:
                filterFunc = { (movie) -> Bool in
                    true
                }
            
            case .favorites:
                filterFunc = { (movie) -> Bool in
                    movie.favorite
                }

            case .watched:
                filterFunc = { (movie) -> Bool in
                    movie.watched
                }
        }
    }
    
    
    var body: some View {
        
        VStack {
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(colorTheme.highlight)
                .multilineTextAlignment(.center)
            
            NavigationView {
                
                List(topMoviesVM.movies, id: \.id) { movie in
                    if filterFunc(movie) {
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
    }
}
