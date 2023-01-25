//

import SwiftUI

struct MovieListItem: View {
    
    var movie: MovieBasic
    
    @State var watched: Bool = false
    @State var favorite: Bool = false
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            Text("\(movie.rank).")
                .font(.title)
            
            AsyncImage(url: movie.imageUrl) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                
                Text(movie.title)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(movie.year)
                    .font(.headline)
                    .foregroundColor(Color.gray)
                
                Text(movie.crew)
                    .font(.footnote)
            }
            
            Spacer()
            
            VStack  {
                
                Spacer()
                
                Button(action: {
                    watched.toggle()
                    print("\(movie.title) was marked as watched")
                }) {
                    Image(systemName: watched ? "eye.fill" : "eye")
                        .resizable()
                        .scaledToFit()
                }
                .frame(width: 20.0, height: 20.0)
                
                Spacer()
                
                Button(action: {
                    favorite.toggle()
                    print("\(movie.title) was marked as favorite")
                }) {
                    Image(systemName: favorite ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                }
                .frame(width: 20.0, height: 20.0)
                
                Spacer()
            }
            
            
        }
        .frame(height: 90.0)
        .onTapGesture {
            print(movie.title)
        }
    }
}


struct MovieListItem_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieListItem(movie: MovieBasic.SHAWSHANK_REDEMPTION)
    }
}
