//

import SwiftUI

struct MovieDetails: View {
    
    
    @AppStorage("mr-theme") private var colorTheme: ColorTheme = .dark
    
    var movieDet: MovieDetailedVM
    
    @State private var showTrailer = false
    
    private var movie: MovieDetailed {
        movieDet.movie
    }
    
    
    var body: some View {
        
        ZStack {
            
            colorTheme.background
            
            ScrollView {
                
                VStack {
                    
                    Text(movie.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(colorTheme.highlight)
                        
                    Text(movie.year)
                        .font(.title3)
                    
                    AsyncImage(url: movie.imageUrl) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 350.0)
                    .border(colorTheme.highlight, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                    
                    Text(movie.plot)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 10.0)
                        .padding(.horizontal, 5.0)
                    
                    Button(action: {
                        showTrailer = true
                    }) {
                        Label("Watch trailer", systemImage: "play.tv")
                    }
                    .frame(width: 250.0, height: 50.0)
                    .background(colorTheme.highlight)
                    .foregroundColor(colorTheme.background)
                    .cornerRadius(8.0)
                    .padding(.vertical, 5.0)
                    .sheet(isPresented: $showTrailer) {
                        WebView(url: movie.trailer.linkEmbed)
                    }
                    
                    VStack(alignment: .leading) {
                        
                        HInfoLabel(label: "Directed by", content: movie.directors)
                        HInfoLabel(label: "Written by", content: movie.writers)
                        
                        HInfoLabel(label: "Stars", content: movie.stars)
                        
                        NavigationLink(destination: ActorsList(actorList: movie.actorList)) {
                            
                            HStack {
                                
                                Text("See full actor list")
                                
                                Image(systemName: "arrow.forward")
                                    .foregroundColor(colorTheme.highlight)
                            }
                            .padding(.leading, 150.0)
                            .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
                        }
                        
                        RatingLabel(rating: movie.rating)
                        HInfoLabel(label: "Duration", content: movie.runtime)
                        HInfoLabel(label: "Genre(s)", content: movie.genres)
                        HInfoLabel(label: "Country", content: movie.countries)
                        HInfoLabel(label: "Language", content: movie.languages)
                    }
                    
                } // VStack
                .padding(.vertical, 15.0)
                
            } // ScrollView
            .foregroundColor(colorTheme.text)
            
        } // ZStack
            
    } // var body: some View
    
} // struct MovieDetails: View


struct MovieDetails_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MovieDetails(movieDet: MovieDetailedVM("tt0111161"))
    }
}
