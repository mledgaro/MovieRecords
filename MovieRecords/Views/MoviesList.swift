//

import SwiftUI

struct MoviesList: View {
    
    
    @EnvironmentObject var topMoviesVM: TopMoviesVM
    
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
            
            NavigationView {
                
                List(topMoviesVM.movies, id: \.id) { movie in
                    if filterFunc(movie) {
                        MovieListItem(index: movie.index)
                    }
                }
            }
            
        }
    }
}

struct MoviesList_Previews: PreviewProvider {
    
    static var previews: some View {
        MoviesList(title: "Top 250", filter: .all)
            .environmentObject(TopMoviesVM())
    }
}
