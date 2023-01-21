//

import SwiftUI

struct MovieDetails: View {
    
    var movie: Movie
    
    var body: some View {
        
        VStack {
            
            Text(movie.title)
                .font(.largeTitle)
            
            Text(movie.year)
                .font(.title3)
            
            Image(movie.imageUrl)
                .resizable()
                .padding(/*@START_MENU_TOKEN@*/.horizontal, 20.0/*@END_MENU_TOKEN@*/)
                .padding(.vertical, 5)
                .scaledToFit()
            
            Text(movie.description)
                .multilineTextAlignment(.center)
                .padding(.all, 2.0)
            
            VStack {
                Text("Cast & crew:")
                    .fontWeight(.bold)
                Text(movie.crew)
                    .multilineTextAlignment(.center)
            }
            .padding(.bottom, 2.0)
            
            HStack {
                Text("IMDb rating:")
                    .fontWeight(.bold)
                Text(String(format: "%.1f", movie.imdbRating))
            }
            .padding(.bottom, 2.0)
            
            VStack {
                Text("Your rating")
                    .fontWeight(.bold)
                HStack {
                    Image(systemName: "star")
                    Image(systemName: "star")
                    Image(systemName: "star")
                    Image(systemName: "star")
                    Image(systemName: "star")
                }
            }
            
            
        }
    }
}

struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails(movie: Movie.DUMMY)
    }
}
