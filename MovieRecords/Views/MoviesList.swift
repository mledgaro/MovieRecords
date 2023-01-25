//

import SwiftUI

struct MoviesList: View {
    
    var title: String
    var movies: [MovieBasic]
    
    var body: some View {
        
        VStack {
            
            Text(title)
                .font(.largeTitle)
            
            List(movies, id: \.id) { movie in
                MovieListItem(movie: movie)
            }
            
        }
    }
}

struct MoviesList_Previews: PreviewProvider {
    
    static var previews: some View {
        MoviesList(title: "Top 250", movies: Array(repeating: MovieBasic.SHAWSHANK_REDEMPTION, count: 5))
    }
}
