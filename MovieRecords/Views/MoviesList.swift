//

import SwiftUI

struct MoviesList: View {
    
    var title: String
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text(title)
                .font(.largeTitle)
            
            List {
                MovieListItem(movie: .constant(Movie.DUMMY))
                MovieListItem(movie: .constant(Movie.DUMMY))
                MovieListItem(movie: .constant(Movie.DUMMY))
                MovieListItem(movie: .constant(Movie.DUMMY))
                MovieListItem(movie: .constant(Movie.DUMMY))
                MovieListItem(movie: .constant(Movie.DUMMY))
                MovieListItem(movie: .constant(Movie.DUMMY))
                MovieListItem(movie: .constant(Movie.DUMMY))
                MovieListItem(movie: .constant(Movie.DUMMY))
                MovieListItem(movie: .constant(Movie.DUMMY))
            }
        }
    }
}

struct MoviesList_Previews: PreviewProvider {
    static var previews: some View {
        MoviesList(title: "Top 250")
    }
}
