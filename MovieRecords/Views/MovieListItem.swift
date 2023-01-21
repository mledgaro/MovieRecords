//

import SwiftUI

struct MovieListItem: View {
    
    @Binding var movie: Movie
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            Text("\(movie.rank).")
                .font(.title)
            
            Image(movie.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                Text(movie.year)
                    .font(.headline)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
            
            Button(action: {
                movie.favorite.toggle()
            }) {
                Image(systemName: movie.favorite ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFit()
            }
            .frame(height: 30.0)
        }
        .frame(height: 90.0)
        //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    }
}

struct MovieListItem_Previews: PreviewProvider {
    static var previews: some View {
        MovieListItem(movie: .constant(Movie.DUMMY))
    }
}
