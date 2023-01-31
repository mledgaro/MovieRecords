//

import SwiftUI


struct MovieListItem: View {
    
    @AppStorage("mr-theme") private var colorTheme: ColorTheme = .dark
    
    @EnvironmentObject var topMoviesVM: TopMoviesVM
    
    var index: Int
    
    var movie: MovieBasic {
        topMoviesVM.movies[index]
    }
    
    
    var body: some View {
        
        VStack {
            
            NavigationLink(destination: MovieDetails(movieDet:  MovieDetailedVM(movie.id))) {
                
                VStack(alignment: .leading, spacing: 5.0) {
                    
                    HStack(alignment: .top) {
                        
                        Text("\(movie.rank).")
                            .font(.title3)
                            .fontWeight(.black)
                            .foregroundColor(colorTheme.highlight)
                        
                        Text(movie.title)
                            .font(.title3)
                            .fontWeight(.bold)
                        
                    } // HStack
                    
                    HStack(alignment: .center) {
                        
                        AsyncImage(url: movie.imageUrl) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .border(colorTheme.highlight, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        
                        VStack(alignment: .leading) {
                            
                            Text(movie.crew)
                                .font(.headline)
                                .fontWeight(.regular)
                                .multilineTextAlignment(.leading)
                            
                            Text(movie.year)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.leading)
                            
                        }
                        
                    } // HStack - Image
                    .frame(height: 90.0)
                    
                } // VStack
                
            } // NavigationLink(destination: MovieDetails(imdbId: movie.id))
            
            MovieCategoriesButtonsV(imdbId: movie.id)
            
        } // VStack
        .foregroundColor(colorTheme.text)
        .background(colorTheme.background)
         
            
    } // var body: some View
    
} // struct MovieListItem: View


struct MovieListItem_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieListItem(index: 0)
            .environmentObject(TopMoviesVM())
            .environmentObject(MoviesUserDataVM())
    }
}
