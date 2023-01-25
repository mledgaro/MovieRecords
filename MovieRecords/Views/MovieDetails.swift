//

import SwiftUI

struct MovieDetails: View {
    
    var movie: MovieDetailed
    
    var body: some View {
        
        VStack {
            
            Text(movie.title)
                .font(.title)
                .multilineTextAlignment(.center)
            
            Text(movie.year)
                .font(.title3)
            
            AsyncImage(url: movie.imageUrl) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            
            Text(movie.plot)
                .multilineTextAlignment(.leading)
                .padding(.all, 2.0)
            
            VStack(alignment: .leading) {
                
                HInfoLabel(label: "Directed by", content: movie.directors)
                HInfoLabel(label: "Written by", content: movie.writers)
                HInfoLabel(label: "Stars", content: movie.stars)
                HInfoLabel(label: "IMDb rating", content: movie.rating)
                HInfoLabel(label: "Duration", content: movie.runtime)
                HInfoLabel(label: "Genre(s)", content: movie.genres)
                HInfoLabel(label: "Country", content: movie.countries)
                HInfoLabel(label: "Language", content: movie.languages)
            }
            
            
//            VStack {
//                Text("Your rating")
//                    .fontWeight(.bold)
//                HStack {
//                    Image(systemName: "star")
//                    Image(systemName: "star")
//                    Image(systemName: "star")
//                    Image(systemName: "star")
//                    Image(systemName: "star")
//                }
//            }
            
            
        }
    }
}

struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails(movie: MovieDetailed.SHAWSHANK_REDEMPTION)
    }
}
