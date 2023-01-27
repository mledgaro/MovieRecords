//

import SwiftUI


struct MovieListItem: View {
    
    
    @EnvironmentObject var topMoviesVM: TopMoviesVM
    
    var index: Int
    
    private var movie: MovieBasic {
        topMoviesVM.movies[index]
    }
    
    
    var body: some View {
        
        VStack {
            
            NavigationLink(destination: MovieDetails(MovieDetailedVM(movie.id))) {
                
                VStack(alignment: .leading, spacing: 5.0) {
                    
                    HStack(alignment: .center) {
                        
                        Text("\(movie.rank).")
                            .font(.title3)
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                        
                        Text(movie.title)
                            .font(.title3)
                            .foregroundColor(Color.white)
                        
                    } // HStack
                    
                    HStack(alignment: .center) {
                        
                        AsyncImage(url: movie.imageUrl) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        
                        VStack(alignment: .leading) {
                            
                            Text(movie.year)
                                .font(.headline)
                                .fontWeight(.black)
                                .multilineTextAlignment(.leading)
                            
                            Text(movie.crew)
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                        }
                        
                    } // HStack - Image
                    .frame(height: 90.0)
                    
                } // VStack
                
            } // NavigationLink(destination: MovieDetails(imdbId: movie.id))
            
            MovieCategoriesButtonsV(index: index)
            
        } // VStack
            
    } // var body: some View
    
} // struct MovieListItem: View


struct MovieListItem_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieListItem(index: 0)
            .environmentObject(TopMoviesVM())
    }
}
