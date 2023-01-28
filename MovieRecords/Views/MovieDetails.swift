//

import SwiftUI

struct MovieDetails: View {
    
    @AppStorage("mr-theme") private var theme: String = "dark"
    @ObservedObject var movieDetailedVM: MovieDetailedVM
    
    
    private var movie: MovieDetailed {
        movieDetailedVM.movie
    }
    
    
    init(_ movieDetVM: MovieDetailedVM) {
        
        self.movieDetailedVM = movieDetVM
    }
    
    
    var body: some View {
            
        ZStack {
            
            Color("\(theme)-background")
            
            ScrollView {
                
                VStack {
                    
                    Text(movie.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("\(theme)-highlight"))
                        
                    Text(movie.year)
                        .font(.title3)
                    
                    AsyncImage(url: movie.imageUrl) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 350.0)
                    .border(Color("\(theme)-highlight"), width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                    
                    Text(movie.plot)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 10.0)
                        .padding(.horizontal, 5.0)
                    
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
                    
                } // VStack
                .padding(.top, 60.0)
                
            } // ScrollView
            .foregroundColor(Color("\(theme)-text"))
            
        } // ZStack
        .ignoresSafeArea()
            
    } // var body: some View
    
} // struct MovieDetails: View


struct MovieDetails_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MovieDetails(MovieDetailedVM("tt0111161"))
    }
}
